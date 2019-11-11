require "spec_helper"

RSpec.describe RavelryApi::User do
  let(:project_json_double) { double() }

  let(:project_json) {
    {
      "body": {
        "projects": [{
          "name": "Awesome Hat"
        }]
      }
    }
  }

  let(:user_json) {
    { "user": {
      "username": 'hi',
      "id": 2
    } }.to_json
  }

  before do
    allow(RavelryApi::User).to receive(:retrieve).and_return(user_json)
    allow(RavelryApi::User).to receive_message_chain(:connection, :get).with('/projects/hi/list.json').and_return(project_json_double)
    allow(project_json_double).to receive(:body).and_return(project_json)
  end

  describe '#initialize' do
    it 'sets username and user id on object' do
      user = RavelryApi::User.new
      expect(user.username).to eq('hi')
      expect(user.user_id).to eq(2)
    end
  end

  describe '#projects' do
    let(:user) { RavelryApi::User.new }

    it "returns a list of names of projects" do
      user = RavelryApi::User.new
      expect(user.projects).to eq(['Awesome Hat'])
    end
  end

  pending '.retrieve' do
    let(:faraday) { instance_double('Faraday') }
    before do
      allow(faraday).to receive(:basic_auth).and_return(nil)
    end
    it 'calls Faraday' do
      allow(Faraday).to receive(:new).with({ url: "https://api.ravelry.com"}).and_return(faraday)
      RavelryApi::User.retrieve
    end
  end
end
