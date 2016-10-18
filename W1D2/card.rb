class Card
  attr_accessor :value, :face_up
  def initialize(value)
    @value = value
    @face_up = false

  end

  def toggle_on
    @face_up = true
  end

  def toggle_off
    @face_up = false
  end
end
