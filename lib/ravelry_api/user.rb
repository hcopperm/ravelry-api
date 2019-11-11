module RavelryApi
  class User
    BASE_URL = 'https://api.ravelry.com'.freeze
    CURRENT_USER_PATH = '/current_user.json'.freeze

    attr_accessor :username, :user_id

    def initialize
      user_data = JSON.parse(RavelryApi::User.retrieve)["user"]
      @username = user_data["username"]
      @user_id = user_data["id"]
    end

    def self.retrieve
      connection.basic_auth(RavelryApi.configuration.basic_auth_username, RavelryApi.configuration.basic_auth_password)
      response = connection.get(CURRENT_USER_PATH)
      response.body
    end

    def projects
      all_json = RavelryApi::User.connection.get("/projects/#{@username}/list.json")
      # for now just return names of projects in an array
      # TODO: project object
      project_json = JSON.parse(all_json.body)
      project_json["projects"].map { |project| project['name'] }
    end

    private
    def self.connection
      @connection ||= Faraday.new(url: BASE_URL)
    end
  end
end
