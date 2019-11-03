require "ravelry_api/version"
require 'ravelry_api/configuration'
require 'ravelry_api/user'
require 'faraday'
require 'pry'
require 'pry-byebug'

module RavelryApi
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= RavelryApi::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
