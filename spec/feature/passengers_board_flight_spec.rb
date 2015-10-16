require "capybara/rspec"

feature "a passenger can board a plane" do

  let(:plane) { Plane.new }
  let(:passenger) { Passenger.new }

  scenario "boarding a specific plane" do
    passenger.check_in
    passenger.board!(plane)
    expect(plane.seats).to include(passenger)
  end

  scenario "they must be checked in before boarding" do
    expect { passenger.board!(plane) }.to raise_error "Check in before boarding"
  end

  xscenario "except when the plane is already full" do
    plane.capacity.times { plane.board(passenger) }
    expect { plane.board(passenger) }.to raise_error "Plane Full"
  end

end
