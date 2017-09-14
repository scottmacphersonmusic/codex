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
end
