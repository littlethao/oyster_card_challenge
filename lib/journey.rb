
# => Knows everything about a journey
class Journey
attr_reader :start_station
attr_reader :journeys
  def initialize
    @in_journey = false
    @start_station = nil
    @end_station = nil
    @journeys = {start_station: @start_station, end_station: @end_station}
  end

  def in_journey?
    !@start_station.nil?
  end

  def start(station)
    self.in_journey = true
    @start_station = station
    @journeys = {start_station: @start_station, end_station: @end_station}
  end

  def finish(station)
    self.in_journey = false
    @end_station = station
    @journeys = {start_station: @start_station, end_station: @end_station}
  end


private

  attr_accessor :in_journey

end
