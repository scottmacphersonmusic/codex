require 'rails_helper'

describe Song do
  subject {
    described_class.new(
      title: 'Oleo',
      key: 'Bb',
    )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without ' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without ' do
    subject.key = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'has many CodexSongs' do
      assc = described_class.reflect_on_association(:codex_songs)
      expect(assc.macro).to eq :has_many
    end

    it 'has many Codices through CodexSongs' do
      assc = described_class.reflect_on_association(:codices)
      expect(assc.macro).to eq :has_many
    end
  end
end
