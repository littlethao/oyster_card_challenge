class Journeylog

 def initialize(journey_class: 'station' )
    @journey_class = journey_class
    @journeys = []
 end

 def start(station)
   @journey_class.start(station)
   @journeys << station
 end

 def finish(station)
   @journeys << @journey_class.finish(station)
 end

attr_reader :journey_class
 def journeys
   @journeys.dup
 end
end
