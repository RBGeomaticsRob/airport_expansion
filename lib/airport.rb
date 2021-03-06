class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :stationed_planes
  attr_reader :capacity

  def initialize(options = {})
    options = defaults.merge(options)
    @stationed_planes = []
    @capacity = options[:capacity]
  end

  def arrival(plane)
    fail "Airport Full" if airport_full?
    fail "Too Stormy" if Weather.stormy?
    confirm_landing(plane)
    stationed_planes << plane
  end

  def departure(plane = default_plane)
    fail "No plane" if airport_empty?
    fail "Too Stormy" if Weather.stormy?
    confirm_departure(plane)
    stationed_planes.delete(plane)
  end

  private

  def airport_full?
    stationed_planes.length >= capacity
  end

  def airport_empty?
    stationed_planes.empty?
  end

  def default_plane
    stationed_planes.last if stationed_planes.length > 0
  end

  def confirm_departure(plane)
    plane.take_off
  end

  def confirm_landing(plane)
    plane.land
  end

  def defaults
    { capacity: DEFAULT_CAPACITY }
  end
end
