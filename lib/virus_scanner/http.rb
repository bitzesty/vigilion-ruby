module VirusScanner
  class HTTP
    attr_accessor :url, :options, :method

    def initialize
      @conn = ::Faraday.new(url: ENV["VIRUS_SCANNER_API_URL"]) do |c|
        c.request :url_encoded
        c.response :json, content_type: /\bjson$/
        c.adapter ::Faraday.default_adapter
        c.headers = { "X-Auth-Token" => ENV["VIRUS_SCANNER_API_KEY"], "User-Agent" => "VirusScanner #{VirusScanner::VERSION} (#{RUBY_PLATFORM}, Ruby #{RUBY_VERSION})" }
      end
    rescue VirusScanner::HttpError => e
      handle_exception(e)
    end

    def post(uuid, url)
      response = @conn.post "/scan", uuid: uuid, url: url
      response.body
    rescue VirusScanner::Error => e
      handle_exception(e)
    end

    def get(uuid)
      response = @conn.get "/status/#{uuid}"
      response.body
    rescue VirusScanner::Error => e
      handle_exception(e)
    end

    private

    def handle_exception(e)
      puts e.message
      puts e.backtrace.inspect
    end
  end
end
