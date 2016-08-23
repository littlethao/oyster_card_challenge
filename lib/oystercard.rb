class Oystercard

MAXIMUM_LIMIT = 90
MINIMUM_FARE = 1

attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail 'Top up limited exceeded' if amount + balance > MAXIMUM_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail 'Balance low!' if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
