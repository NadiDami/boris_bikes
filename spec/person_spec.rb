require 'person'

describe Person do 

  let(:person) {Person.new}
  let(:station) {double :station}

  it 'does not have a bike' do
    expect(person.has_bike?).to be_false
  end

  it 'has a bike' do
    person = Person.new :bike
    expect(person.has_bike?).to be_true
  end

  it 'can rent a bike from the station' do
    expect(station).to receive(:release)
    person.rent_bike_from station
  end

  it 'has a bike after renting from the station' do
    station = double :station, {:release => :bike}
    person.rent_bike_from station
    expect(person.has_bike?).to be_true
  end

  it 'returns a bike to the station' do
    expect(station).to receive(:dock)
    person.return_bike_to station
  end

  it 'has no bike after returning it to the station' do
    person = Person.new :bike
    station = double :station, {:dock => :bike}
    person.return_bike_to station 
    expect(person.has_bike?).to be_false
  end

end
