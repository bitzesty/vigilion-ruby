module Vigilion
  class Configuration < OpenStruct
    include Singleton

    def self.configure
      yield instance
    end

    def self.method_missing(m, *args, &block)
      instance.send(m, *args)
    end
  end

  Configuration.server_url = "http://localhost:5000"
  Configuration.access_key_id = ""
end

