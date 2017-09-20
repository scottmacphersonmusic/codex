require 'rails_helper'

describe Instrument do
  subject { described_class.new name: 'piano' }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a key' do
    subject.key = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it 'has and belongs to many PracticeSessions' do
      assc = described_class.reflect_on_association(:practice_sessions)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end
end
