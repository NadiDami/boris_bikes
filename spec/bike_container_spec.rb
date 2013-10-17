shared_examples 'a bike container' do

  let(:container) { described_class.new }
  let (:bike) { double :bike}

  it 'accepts a bike' do
    expect(container.bike_count).to eq 0
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
  
end