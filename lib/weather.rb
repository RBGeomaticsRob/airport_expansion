module Weather
  def self.stormy?
    forecast == :stormy
  end

  private

  def self.forecast
    rand(1..5) < 5 ? :sunny : :stormy
  end
end
