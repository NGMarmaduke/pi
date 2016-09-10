module Pi
  module Tfl
    module ApiHelper
      def fetch(url)
        HTTP.get(url).to_s
      end

      def parse(json, klass)
        array = JSON.parse(json)
        array.map { |data| klass.new(data) }
      end
    end
  end
end