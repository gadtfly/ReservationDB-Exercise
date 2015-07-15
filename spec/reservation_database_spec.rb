require_relative '../reservation_database'
require_relative '../reservation'

describe ReservationDatabase do
  let(:db) { ReservationDatabase.new }

  # note: not testing for it, but `#initialize` should
  # initialize an empty `Array` in an instance variable
  # to use as the actual `Reservation` storage

  describe '#add' do
    it 'accepts a reservation' do
      db.add(Reservation.new(person: 'Jane Doe', hotel: 'Mariott'))
    end
  end

  context 'with some reservations already in the database' do
    let(:jane_doe)  { Reservation.new(person: 'Jane Doe', hotel: 'Mariott') }
    let(:john_doe)  { Reservation.new(person: 'John Doe', hotel: 'Mariott') }
    let(:jon_snow)  { Reservation.new(person: 'Jon Snow', hotel: 'The Wall') }
    before do
      db.add(jane_doe)
      db.add(john_doe)
      db.add(jon_snow)
    end

    describe '#all' do
      it 'returns all reservations from the database' do
        expect(db.all).to include(jane_doe, john_doe, jon_snow)
      end
    end

    describe '#by_hotel' do
      it 'returns a Hash, where each key is a hotel, and its value is an Array of Reservations there' do
        expect(db.by_hotel).to eq({ 'Mariott'  => [jane_doe, john_doe], 
                                    'The Wall' => [jon_snow]              })
      end
    end

    describe '#at_hotel' do
      it 'includes people at the specified hotel' do
        expect(db.at_hotel('Mariott')).to include(jane_doe, john_doe)
      end

      it 'does not include people not at the specified hotel' do
        expect(db.at_hotel('Mariott')).to_not include(jon_snow)
      end
    end

    describe '#at_same_hotel' do
      it 'includes people staying at the same hotel' do
        expect(db.at_same_hotel(jane_doe)).to include(john_doe)
      end

      it 'does not include people staying at a different hotel' do
        expect(db.at_same_hotel(jane_doe)).to_not include(jon_snow)
      end
    end
  end
end
