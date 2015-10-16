class Plane
  DEFAULT_SEATS = 50
  attr_reader :flying, :capacity, :seats
  alias_method :airborne?, :flying

  def initialize(options = {})
    options = defaults.merge(options)
    @flying = options[:airborne]
    @capacity = options[:capacity]
    @seats = []
  end

  def take_off
    @flying = true
    self
  end

  def land
    @flying = false
    self
  end

  def full?
    seats.length >= capacity
  end

  private

  def defaults
    { airborne: true, capacity: DEFAULT_SEATS }
  end

end
