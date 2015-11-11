require 'faraday'

module Vigilion
  class Authentication < Faraday::Middleware
    KEY = 'X-Api-Key'

    def call(env)
      if env[:body].respond_to? :read
        env.request_headers[KEY] = HTTP.digest(env[:body].read)
        env[:body].rewind
      else
        env.request_headers[KEY] = HTTP.digest(env[:body].to_s)
      end
      @app.call(env)
    end
  end
  Faraday::Request.register_middleware :authentication => lambda { Authentication }
end
