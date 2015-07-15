class ReservationDatabase
  def initialize
    @reservations = []
  end

  def add(reservation)
    @reservations << reservation
  end

  def all
    @reservations
  end

  def by_hotel
    @reservations.group_by{ |reservation| reservation.hotel }
  end

  def at_hotel(hotel)
    @reservations.select{ |reservation| reservation.hotel == hotel }
  end

  def at_same_hotel(person)
    self.at_hotel(person.hotel)
  end
end
