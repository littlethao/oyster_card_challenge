require_relative 'oystercard'
require_relative 'journey'

class Journeylog

 def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {start_station: nil, end_station: nil}
 end

 def start(station)
   @current_journey[:start_station] = station
 end

 def finish(station)
   @current_journey[:end_station] = station
   @journeys << @current_journey
 end

attr_reader :journey_class
 def journeys
   @journeys.dup
 end
end
