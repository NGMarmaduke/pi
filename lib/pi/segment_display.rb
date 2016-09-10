require 'wiringpi2'

module Pi
  class SegmentDisplay
    class << self
      SEGMENTS = {
        A: 8,
        B: 12,
        C: 2,
        D: 0,
        E: 7,
        F: 9,
        G: 3,
        DP: 13
      }.freeze

      def display(number)
        digit = number.to_i % 10
        map = MAPS[digit]
        display_map(map)
      end

      def decimal_place(on: true)
        value = on ? WiringPi::LOW : WiringPi::HIGH
        gpio.digital_write(SEGMENTS[:DP], value)
      end

      private

      def display_map(map)
        map.each do |segment, value|
          pin = SEGMENTS[segment]
          gpio.digital_write(pin, value)
        end
      end

      def gpio
        @gpio ||= WiringPi::GPIO.new do |gpio|
          SEGMENTS.values.each do |pin|
            gpio.pin_mode(pin, WiringPi::OUTPUT)
          end
        end
      end

      MAPS = {
        0 => {
          A: WiringPi::LOW,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::LOW,
          E: WiringPi::LOW,
          F: WiringPi::LOW,
          G: WiringPi::HIGH
        },
        1 => {
          A: WiringPi::HIGH,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::HIGH,
          E: WiringPi::HIGH,
          F: WiringPi::HIGH,
          G: WiringPi::HIGH
        },
        2 => {
          A: WiringPi::LOW,
          B: WiringPi::LOW,
          C: WiringPi::HIGH,
          D: WiringPi::LOW,
          E: WiringPi::LOW,
          F: WiringPi::HIGH,
          G: WiringPi::LOW
        },
        3 => {
          A: WiringPi::LOW,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::LOW,
          E: WiringPi::HIGH,
          F: WiringPi::HIGH,
          G: WiringPi::LOW
        },
        4 => {
          A: WiringPi::HIGH,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::HIGH,
          E: WiringPi::HIGH,
          F: WiringPi::LOW,
          G: WiringPi::LOW
        },
        5 => {
          A: WiringPi::LOW,
          B: WiringPi::HIGH,
          C: WiringPi::LOW,
          D: WiringPi::LOW,
          E: WiringPi::HIGH,
          F: WiringPi::LOW,
          G: WiringPi::LOW
        },
        6 => {
          A: WiringPi::LOW,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::LOW,
          E: WiringPi::LOW,
          F: WiringPi::LOW,
          G: WiringPi::LOW
        },
        7 => {
          A: WiringPi::HIGH,
          B: WiringPi::HIGH,
          C: WiringPi::LOW,
          D: WiringPi::LOW,
          E: WiringPi::LOW,
          F: WiringPi::LOW,
          G: WiringPi::LOW
        },
        8 => {
          A: WiringPi::LOW,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::LOW,
          E: WiringPi::LOW,
          F: WiringPi::LOW,
          G: WiringPi::LOW
        },
        9 => {
          A: WiringPi::LOW,
          B: WiringPi::LOW,
          C: WiringPi::LOW,
          D: WiringPi::HIGH,
          E: WiringPi::HIGH,
          F: WiringPi::LOW,
          G: WiringPi::LOW
        }
      }.freeze
    end
  end
end