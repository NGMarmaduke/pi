require 'pi/tfl'
require 'pi/segment_display'

module Pi
  module Monitors
    class NextBus
      BUS_STOP_ID = '490010001S'

      def perform
        SegmentDisplay.decimal_place(on: true)

        SegmentDisplay.display(minutes_to_next)

        SegmentDisplay.decimal_place(on: false)
      end

      private

      def minutes_to_next
        (seconds_to_next / 60).round
      end

      def seconds_to_next
        bus_stop.next_arrival.seconds_to_arrival
      end

      def bus_stop
        @stop ||= Tfl::BusStop.new(BUS_STOP_ID)
      end
    end
  end
end