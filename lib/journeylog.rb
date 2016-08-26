require_relative 'oystercard'
require_relative 'journey'

class Journeylog

  attr_reader :current_journey, :journey_class

 def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {start_station: nil, end_station: nil}
 end

 def start(station)
   @current_journey[:start_station] = station
   Journey.new(station)
 end

 def finish(station)
   @current_journey[:end_station] = station
   @journeys << @current_journey
 end

 def journeys
   @journeys.dup
 end
end
