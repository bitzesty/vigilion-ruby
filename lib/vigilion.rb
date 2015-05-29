# faraday for connection handling
require "faraday"
require "faraday_middleware"

# Vigilion
require "vigilion/version"
require "vigilion/configuration"
require "vigilion/file"
require "vigilion/http"
require "vigilion/errors"

module Vigilion
  def self.configure(&block)
    Vigilion::Configuration.configure(&block)
  end
end