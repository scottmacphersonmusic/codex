FactoryGirl.define do
  factory :song do
    sequence(:title) { |n| "song_#{n}" }
  end
end
