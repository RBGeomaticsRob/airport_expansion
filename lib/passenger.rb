class Passenger
  attr_reader :status, :on_board
  alias_method :checked_in?, :status
  alias_method :on_board?, :on_board

  def initialize(options = {})
    options = defaults.merge(options)
    @status = options[:checked_in]
    @on_board = options[:on_board]
  end

  def check_in
    @status = true
    self
  end

  def board!(plane)
    fail "Check in before boarding" if !checked_in?
    @on_board = true
    seat_passenger_on(plane)
  end

  private

  def defaults
    { checked_in: false, on_board: false }
  end

  def seat_passenger_on(plane)
    plane.seats << self
  end
end
