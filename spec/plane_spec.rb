require "plane"

describe Plane do

  let(:passenger) { double(:passenger, checked_in?: true) }

  before { allow(passenger).to receive(:check_in) { passenger } }

  it "has an airborne status when created" do
    expect(subject).to respond_to :airborne?
  end

  it "can take off" do
    expect(subject.take_off).to be_airborne
  end

  it "can land" do
    expect(subject.land).not_to be_airborne
  end

  it "has an adjustable number of seats" do
    random_seating = rand(50..100)
    plane = Plane.new(capacity: random_seating)
    expect(plane.capacity). to eq random_seating
  end

  it "knows when it is full" do
    subject.capacity.times { subject.seats << passenger }
    expect(subject).to be_full
  end
end
