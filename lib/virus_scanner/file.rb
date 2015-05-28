module VirusScanner
  class File
    attr_accessor :body
    def self.scan_url(uuid, url)
      # Pass UUID and URL to file to check to the HTTP requests handler
      body = handler.post(uuid, url)

      body
    end

    def self.check_status(uuid)
      body = handler.get(uuid)

      body
    end

    def self.handler
      VirusScanner::HTTP.new
    end
  end
end
