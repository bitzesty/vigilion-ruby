module Vigilion
  class HTTP
    attr_accessor :url, :options, :method

    def initialize
      validate_api_key
      @conn = ::Faraday.new(url: Configuration.server_url) do |c|
        c.request :url_encoded
        c.response :json, content_type: /\bjson$/
        c.adapter ::Faraday.default_adapter
        c.headers = { "X-Auth-Token" => Configuration.api_key, "User-Agent" => "Vigilion #{Vigilion::VERSION} (#{RUBY_PLATFORM}, Ruby #{RUBY_VERSION})" }
      end
    end

    def scan_url(uuid, url)
      request = { uuid: uuid, url: url.to_json }
      response = @conn.post "/scan", request
      unless response.status.between? 200, 299
        raise Vigilion::Error.new("Invalid scanning request: #{request}. Response: #{response.body}")
      end
      response.body
    end

    def get(uuid)
      response = @conn.get "/status/#{uuid}"
      response.body
    end

  private

    def validate_api_key
      raise Vigilion::Error.new("api_key not present") unless Configuration.api_key
    end
  end
end
