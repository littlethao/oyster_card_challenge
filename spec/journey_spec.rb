require "journey"

describe Journey do

  let(:station) { double :station}

  it 'not to be in journey at initialisation point' do
    expect(subject.in_journey?).to be false
  end

  it "changes the in_journey status to true when journey starts" do
    subject.start(station)
    expect(subject.in_journey?).to be true
  end

  it 'isn\'t in journey anymore when touch out' do
    subject.finish(station)
    expect(subject.in_journey?).to be false
  end

  it 'stores station argument' do
    subject.start(station)
    expect(subject.instance_variable_get(:@start_station)).to eq station
  end

  it 'stores exit station when finishing the journey' do
    subject.finish(station)
    expect(subject.instance_variable_get(:@end_station)).to eq station
  end


  it 'creates a hash inside an @journey array for each journey with entry station and exit station' do
    subject.start(station)
    subject.finish(station)
    expect(subject.instance_variable_get(:@journeys)).to include(:start_station => station, :end_station => station)
  end
end
