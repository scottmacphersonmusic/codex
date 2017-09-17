require 'rails_helper'

describe CodexSong do
  describe 'Associations' do
    it 'belongs to a Codex' do
      assc = described_class.reflect_on_association(:codex)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to a Song' do
      assc = described_class.reflect_on_association(:song)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
