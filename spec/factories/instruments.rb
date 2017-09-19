FactoryGirl.define do
  factory :instrument do
    sequence(:name) { |n| "instrument_#{n}" }
  end
end
