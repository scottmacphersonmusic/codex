FactoryGirl.define do
  factory :codex do
    sequence(:name) { |n| "codex_#{n}" }
  end
end
