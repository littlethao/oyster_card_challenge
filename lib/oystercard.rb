require_relative 'station'
require_relative 'journeylog'

class Oystercard

attr_accessor :journeys

LIMIT = 90
BALANCE = 0
MINIMUM_BALANCE = 1

  def initialize(balance = BALANCE)
    @balance = balance
#    @journeylog = journeylog
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail 'below minimum balance' if empty?
    #journey = Journey.new
    Journeylog.new.start(station)
    # @entry_station = station
    # @current_journey.start(station)
  end

  def touch_out(station)
    deduct
    @journeylog.finish(station)

#    deduct(amount)
  end

  private

  attr_reader :balance

  def deduct
    @balance -= @journeylog.calculate_fare
  end

  def full?(amount)
    @balance + amount > LIMIT
  end

  def empty?
    @balance < MINIMUM_BALANCE
  end

end
