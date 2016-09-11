require 'pi/canary'
require 'pi/led_display'

module Pi
  module Monitors
    class PeopleHome
      ID_MAP = {
        185327 => 4, # Nick
        185345 => 5, # Jon
        185343 => 6  # Matt
      }

      def perform
        led_status.each do |pin, home|
          LedDisplay.toggle(pin, on: home)
        end
      end

      private

      def led_status
        current = people_home
        ID_MAP.each_with_object({}) do |(id, led_number), hash|
          hash[led_number] = current.include?(id)
        end
      end

      def people_home
        location.customers_present
      end

      def location
        @location ||= Canary::Location.new
      end
    end
  end
end