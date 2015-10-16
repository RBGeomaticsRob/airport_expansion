require "weather"

describe Weather do

  it "can provide a forecast" do
    expect(subject.forecast).to eq(:stormy).or eq(:sunny)
  end

end
