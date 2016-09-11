require 'pi/api_helper'

module Pi
  module Canary
    class Auth
      include ApiHelper

      attr_reader :email, :password

      def initialize(email:, password:)
        @email = email
        @password = password
      end

      def token
        JSON.parse(auth_response)['access_token']
      end

      private

      def auth_response
        post("#{ API_URL }/auth/login", { email: email, password: password })
      end
    end
  end
end