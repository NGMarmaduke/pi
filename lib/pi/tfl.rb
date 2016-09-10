require "http"
require "json"

require 'pi/tfl/api_helper'
require 'pi/tfl/bus_stop'
require 'pi/tfl/prediction'

module Pi
  module Tfl
    API_URL = "https://api.tfl.gov.uk".freeze
  end
end