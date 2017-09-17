require 'rails_helper'

describe Codex do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'anything'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'has many CodexSongs' do
      assc = described_class.reflect_on_association(:codex_songs)
      expect(assc.macro).to eq :has_many
    end

    it 'has many Codices through CodexSongs' do
      assc = described_class.reflect_on_association(:songs)
      expect(assc.macro).to eq :has_many
    end
  end
end
