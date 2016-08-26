require 'journeylog'

describe Journeylog do
  let(:station) {double :station}

  it 'should start a new journey with an entry station' do
    expect(subject.start(station)).to eq ([station])
  end

  it 'should add an exit station to the current journey' do
    expect(subject.finish(station)).to eq([station])
  end

  it 'should return the list of journey history within an array' do
    expect(subject.journeys).to eq([])
  end
end
