require 'oystercard'

describe Oystercard do
  it 'Describes an account when it is first opened' do
    expect(subject.balance).to eq (0)
  end

  describe '#top_up' do
    it 'tops up Oystercard by amount £20' do
      expect { subject.top_up(20) }.to change{subject.balance}.by(20)
    end

    it 'raises an error when top up limit is exceeded' do
      maximum_limit = Oystercard::MAXIMUM_LIMIT
      subject.top_up(maximum_limit)
      expect{ subject.top_up(1) }.to raise_error 'Top up limited exceeded'
    end
  end

  describe '#deduct' do
    it 'deducts journey fare by amount £10' do
      subject.top_up(20)
      expect { subject.deduct(10) }.to change{subject.balance}.by(-10)
    end
  end

  describe '#touch_in' do
    it 'shows the cardholder is in journey' do
      subject.top_up(20)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'raises an error when the balance is less than £1 when touching in' do
      expect{subject.touch_in}.to raise_error 'Balance low!'
    end
  end

  describe '#touch_out' do
    it 'shows the cardholder has ended the journey' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  describe '#in_journey?' do
    it "is initially not in journey" do
      expect(subject).not_to be_in_journey
    end
  end
end
