class Reservation
  attr_accessor :person, :hotel

  def initialize(hash = {})
    self.person = hash[:person]
    self.hotel  = hash[:hotel]
  end
end
