module Vigilion
  class HTTP
    attr_accessor :url, :options, :method

    def initialize
      validate_access_keys
      @conn = ::Faraday.new(url: Configuration.server_url) do |c|
        c.request :multipart
        c.request :url_encoded
        c.response :json, content_type: /\bjson$/
        c.adapter ::Faraday.default_adapter
        c.headers = {
          "Auth-Key" => Configuration.access_key_id,
          "User-Agent" => "Vigilion #{Vigilion::VERSION} (#{RUBY_PLATFORM}, Ruby #{RUBY_VERSION})" }
      end
    end

    def scan_url(key, url)
      send scan: { key: key, url: url }
    end

    def scan_path(key, path)
      send scan: { key: key, file: Faraday::UploadIO.new(path, 'application') }
    end

    def get(uuid)
      response = @conn.get "/scans/#{uuid}"
      response.body
    end

    def self.digest(body)
      Digest::MD5.hexdigest("#{body}#{Vigilion::Configuration.secret_access_key}")
    end

  private

    def send(request)
      response = @conn.post "/scans", request do |req|
        req.headers["Auth-Hash"] = self.class.digest(request)
      end
      unless response.status.between? 200, 299
        raise Vigilion::Error.new("Invalid scanning request: #{request}. Response: #{response.body}")
      end
      response.body
    end

    def validate_access_keys
      raise Vigilion::Error.new("access_key_id not present") unless Configuration.access_key_id
      raise Vigilion::Error.new("secret_access_key not present") unless Configuration.secret_access_key
    end
  end
end
