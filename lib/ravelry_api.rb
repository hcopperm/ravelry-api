require "ravelry_api/version"
require 'ravelry_api/configuration'
require 'ravelry_api/user'
require 'faraday'
require 'pry'
require 'pry-byebug'

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'


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
