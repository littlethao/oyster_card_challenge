require 'journeylog'

describe Journeylog do
  let(:journeylog) { described_class.new}
  let(:station) {double :station}

  it 'should start a new journey with an entry station' do
    expect(journeylog.start(station)).to eq ([station])
  end

  it 'should add an exit station to the current journey' do
    expect(journeylog.finish(station)).to eq([station])
  end

  it 'should return the list of journey history within an array' do
    expect(journeylog.journeys).to eq([])
  end
end
