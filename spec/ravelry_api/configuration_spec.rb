require "spec_helper"

RSpec.describe RavelryApi::Configuration do
  describe "#basic_auth_username=" do
    it "can set value" do
      config = RavelryApi::Configuration.new
      config.basic_auth_username = 'hello'
      expect(config.basic_auth_username).to eq('hello')
    end
  end
end
