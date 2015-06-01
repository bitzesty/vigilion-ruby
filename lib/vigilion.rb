# faraday for connection handling
require "faraday"
require "faraday_middleware"

# Vigilion
require "vigilion/version"
require "vigilion/configuration"
require "vigilion/http"
require "vigilion/errors"

module Vigilion
  def self.configure(&block)
    Vigilion::Configuration.configure(&block)
  end

  def self.scan_url(identifier, url)
    Vigilion::HTTP.new.scan_url identifier, url
  end

  def self.check_status(identifier)
    Vigilion::HTTP.new.get(identifier)
  end
end