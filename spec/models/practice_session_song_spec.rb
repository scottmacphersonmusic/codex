require 'rails_helper'

describe PracticeSessionSong do
  let(:codex) { create :codex }
  let(:practice_session) { create :practice_session, codex: codex }

  subject { practice_session.practice_session_songs.build }

  before {
    create :instrument
    create :codex_song, codex: codex, song: create(:song)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a practice session' do
    subject.practice_session_id = nil
    expect(subject).to_not be_valid
  end

  it 'assigns song before validation' do
    subject.valid?
    expect(subject.song).to be_present
  end

  it 'assigns instrument before validation' do
    subject.valid?
    expect(subject.instrument).to be_present
  end

  describe 'Associations' do
    it 'belongs to a PracticeSession' do
      assc = described_class.reflect_on_association(:practice_session)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to a Song' do
      assc = described_class.reflect_on_association(:song)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to an Instrument' do
      assc = described_class.reflect_on_association(:instrument)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
