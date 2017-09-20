require 'rails_helper'

describe PracticeSession do
  subject { described_class.new }

  describe 'Associations' do
    it 'has many PracticeSessionSongs' do
      assc = described_class.reflect_on_association(:practice_session_songs)
      expect(assc.macro).to eq :has_many
    end

    it 'has many Songs through PracticeSessionSongs' do
      assc = described_class.reflect_on_association(:songs)
      expect(assc.macro).to eq :has_many
    end

    it 'has and belongs to many Instruments' do
      assc = described_class.reflect_on_association(:instruments)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end
end
