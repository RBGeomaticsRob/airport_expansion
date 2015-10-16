require "capybara/rspec"

feature "a passenger can board a plane" do

  let(:plane) { Plane.new }
  let(:passenger) { Passenger.new }

  def board_passenger_on_plane
    passenger.check_in
    passenger.board!(plane)
  end

  scenario "boarding a specific plane" do
    board_passenger_on_plane
    expect(plane.seats).to include(passenger)
  end

  scenario "they must be checked in before boarding" do
    expect { passenger.board!(plane) }.to raise_error "Check in before boarding"
  end

  scenario "except when the plane is already full" do
    plane.capacity.times { board_passenger_on_plane }
    expect { board_passenger_on_plane }.to raise_error "Plane Full"
  end

end
