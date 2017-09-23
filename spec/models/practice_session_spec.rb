require 'rails_helper'

describe PracticeSession do
  let(:codex) { create :codex }
  subject { codex.practice_sessions.build }

  it 'defaults done to false' do
    expect(subject.done?).to eq false
  end

  it 'assigns instruments before validation' do
    create :instrument
    expect{ subject.valid? }.to change{ subject.instruments.first }
  end

  it 'is not valid without instruments' do
    song = create :song
    create :codex_song, codex: codex, song: song
    expect(subject).to_not be_valid
  end

  it 'is not valid without songs' do
    create :instrument
    expect(subject).to_not be_valid
  end

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

    it 'belongs to a Codex' do
      assc = described_class.reflect_on_association(:codex)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
