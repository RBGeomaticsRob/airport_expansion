require "weather"

describe Weather do

  it "can provide a forecast" do
    expect(subject.forecast).to eq(:stormy).or eq(:sunny)
  end

  it "can report if it is stormy" do
    allow(subject).to receive(:forecast) { :stormy }
    expect(subject.stormy?).to be_truthy
  end

end
