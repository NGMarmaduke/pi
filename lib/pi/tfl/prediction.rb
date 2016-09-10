module Pi
  module Tfl
    class Prediction
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def expected_arrival
        Time.parse(@data['expectedArrival'])
      end

      def seconds_to_arrival
        expected_arrival - Time.now
      end
    end
  end
end