require 'rails_helper'

describe PracticeSessionSong do
  subject { described_class.new }

  describe 'Associations' do
    it 'belongs to a PracticeSession' do
      assc = described_class.reflect_on_association(:practice_session)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to a Song' do
      assc = described_class.reflect_on_association(:song)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has one Instrument' do
      assc = described_class.reflect_on_association(:instrument)
      expect(assc.macro).to eq :has_one
    end
  end
end
