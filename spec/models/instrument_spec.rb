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
end
