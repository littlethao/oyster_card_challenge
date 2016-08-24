
require 'oystercard.rb'

describe Oystercard do
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey){ {entry: entry_station, exit: exit_station}}

  it 'checks default balance of Oystercard is 0' do
    expect(subject.balance).to eq 0
  end

  it 'checks that the card has an empty list of journeys' do
    expect(subject.journeys).to be_empty
  end

  it 'adds money to my oyster card' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'checks that touching in and out creates one journey' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include journey
  end

    describe '#top_up' do
      before do
        subject.top_up(Oystercard::BALANCE_LIMIT)
      end

      it 'will not allow a balance to exceed 90' do
        message = "Your top up will exceed balance limit of #{Oystercard::BALANCE_LIMIT}!"
        expect{ subject.top_up 1 }.to raise_error message
      end
    end

  describe '#touch_in' do
      let(:station) {double :station}

    it 'raises an error if minimum balance on oystercard is less than 1' do
      expect{subject.touch_in(station)}.to raise_error 'you have insufficient funds on your oystercard'
    end
  end

  describe '#touch_out' do

    it 'updates balance by deducting fare' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
    end
  end
end
