require "capybara/rspec"

feature "a passenger can board a plane" do

  let(:plane) { Plane.new }
  let(:passenger) { Passenger.new }

  scenario "boarding a specific plane" do
    passenger.check_in
    passenger.board!(plane)
    expect(plane.seats).to include(passenger)
  end

  xscenario "is checked in once boarded the plane" do
    plane.board(passenger)
    expect(passenger).to be_checked_in
  end

  xscenario "except when the plane is already full" do
    plane.capacity.times { plane.board(passenger) }
    expect { plane.board(passenger) }.to raise_error "Plane Full"
  end

end
