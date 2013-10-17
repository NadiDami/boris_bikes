shared_examples 'a bike container' do

  let(:container) { described_class.new }
  let(:bike) { double :bike, broken?: false } #ask about syntax 
  let(:broken_bike) {double :broken_bike, broken?: true} 


  it 'accepts a bike' do
    container.dock(bike)
    expect(container.bike_count).to eq 1
  end

  it 'releases a bike' do
    container.dock(bike)
    container.release
    expect(container.bike_count). to eq 0
end

  it "knows when it's full" do
    container = described_class.new([bike, bike], 2)
    expect(container.full?).to be_true
end

  it "does not accept a bike if it's full" do
    container = described_class.new([bike, bike], 2)
    expect(lambda { container.dock(bike) }).to raise_error(RuntimeError)
  end

  it 'provides the list of working bikes' do
    container.dock bike 
    container.dock broken_bike
    expect(container.working_bikes).to eq ([bike])
  end

  it 'provides the list of broken bikes' do
    container.dock bike
    container.dock broken_bike
    expect(container.broken_bikes).to eq ([broken_bike])
  end

  it 'provides the number of working bikes' do
    container.dock bike
    container.dock broken_bike
    expect(container.working_bike_count).to eq 1
  end

  it 'provides the number of broken bikes' do
    container.dock bike
    container.dock broken_bike
    expect(container  .broken_bike_count).to eq 1
  end

  
end