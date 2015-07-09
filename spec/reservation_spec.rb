require_relative '../reservation'

describe Reservation do
  describe 'basic attributes' do
    it 'includes person' do
      reservation = Reservation.new
      reservation.person             = 'Jane Doe'
      expect(reservation.person).to eq('Jane Doe')
    end

    it 'includes name' do
      reservation = Reservation.new
      reservation.hotel             = 'Mariott'
      expect(reservation.hotel).to eq('Mariott')
    end
  end

  describe '#initialize' do
    it 'can be called without arguments' do
      Reservation.new
    end

    it 'can be called with an empty hash' do
      Reservation.new({})
    end

    it 'can set basic attributes from a hash' do
      reservation = Reservation.new(person: 'Jane Doe', hotel: 'Mariott')
      expect(reservation.person).to eq('Jane Doe')
      expect(reservation.hotel).to eq('Mariott')
    end
  end
end
