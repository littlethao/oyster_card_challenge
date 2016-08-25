require "journey"

describe Journey do
  let(:journey) {described_class.new}
  let(:station) { double :station}

  it 'not to be in journey at initialisation point' do
    expect(journey.in_journey?).to be false
  end

  it "changes the in_journey status to true when journey starts" do
    journey.start(station)
    expect(journey.in_journey?).to be true
  end

  it 'isn\'t in journey anymore when touch out' do
    journey.finish(station)
    expect(journey.in_journey?).to be false
  end

  it 'stores station argument' do
    journey.start(station)
    expect(journey.instance_variable_get(:@start_station)).to eq station
  end

  it 'stores exit station when finishing the journey' do
    journey.finish(station)
    expect(journey.instance_variable_get(:@end_station)).to eq station
  end

  it 'creates a hash inside an @journey array for each journey with entry station and exit station' do
    journey.start(station)
    journey.finish(station)
    expect(journey.instance_variable_get(:@journeys)).to include(:start_station => station, :end_station => station)
  end

  describe 'fare' do
    it 'charges a penalty if no station' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'charges a minimum fare when station is present' do
      journey.start(station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end
  it 'charges a penalty fare if you have already started a journey' do
    expect(journey.start(station)).to eq Journey::PENALTY_FARE
  end

  it 'doesn\'t charge you if this is a new journey' do

  end

  it 'charges you a penalty fare if you try to finish without starting' do

  end

  it 'charges you a minimum fare for completing a full journey' do

  end
end
