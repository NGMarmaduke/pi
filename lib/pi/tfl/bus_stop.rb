module Pi
  module Tfl
    class BusStop
      include ApiHelper

      attr_reader :id

      def initialize(id)
        @id = id
      end

      def next_arrival
        arrivals.sort_by(&:expected_arrival).first
      end

      def arrivals
        parse(raw_arrivals, Pi::Tfl::Prediction)
      end

      private

      def raw_arrivals
        fetch(arrivals_url)
      end

      def resource_url
        "#{ API_URL }/StopPoint/#{ id }"
      end

      def arrivals_url
        "#{ resource_url }/arrivals"
      end
    end
  end
end