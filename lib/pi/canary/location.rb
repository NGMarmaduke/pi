require 'pi/api_helper'

module Pi
  module Canary
    class Location
      def customers_present
        localtion['customers_present']
      end

      def localtion
        JSON.parse(data).first
      end

      def data
        HTTP.auth("Bearer #{ ENV['CANARY_TOKEN'] }")
            .get(location_url)
      end

      private

      def location_url
        "#{ API_URL }/locations"
      end
    end
  end
end