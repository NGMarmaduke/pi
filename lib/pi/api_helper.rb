require "http"
require "json"

module Pi
  module ApiHelper
    def fetch(url)
      HTTP.get(url).to_s
    end

    def post(url, json)
      puts "posting: #{json} to #{url}"
      HTTP.post(url, json: json)
    end

    def parse(json, klass)
      array = JSON.parse(json)
      array.map { |data| klass.new(data) }
    end
  end
end