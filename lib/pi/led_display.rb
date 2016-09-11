require 'wiringpi2'

module Pi
  class LedDisplay
    class << self
      AVAILABLE_PINS = [4, 5, 6]

      def toggle(pin, on: true)
        raise 'pin not available' unless AVAILABLE_PINS.include?(pin)

        value = on ? WiringPi::HIGH : WiringPi::LOW
        gpio.digital_write(pin, value)
      end

      private

      def gpio
        @gpio ||= WiringPi::GPIO.new do |gpio|
          AVAILABLE_PINS.each do |pin|
            gpio.pin_mode(pin, WiringPi::OUTPUT)
          end
        end
      end
    end
  end
end