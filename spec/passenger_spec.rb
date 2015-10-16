require "passenger"

describe Passenger do
  it "has a checked in status" do
    expect(subject).to respond_to(:checked_in?)
  end
  it "can be checked in" do
    expect(subject.check_in).to be_checked_in
  end
  it "can board a plane if checked in" do
    plane = Plane.new
    subject.check_in
    subject.board!(plane)
    expect(subject).to be_on_board
  end
  it "cannot board a plane if not checked in" do
    plane = Plane.new
    expect { subject.board!(plane) }.to raise_error "Check in before boarding"
  end
end
