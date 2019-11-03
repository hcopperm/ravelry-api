module RavelryApi
  class User
    BASE_URL = 'https://api.ravelry.com'.freeze
    CURRENT_USER_PATH = '/current_user.json'.freeze

    def self.retrieve
      connection = Faraday.new(url: BASE_URL)
      connection.basic_auth(RavelryApi.configuration.basic_auth_username, RavelryApi.configuration.basic_auth_password)
      response = connection.get(CURRENT_USER_PATH)
      response.body
    end
  end
end
