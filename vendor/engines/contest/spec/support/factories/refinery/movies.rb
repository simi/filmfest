
FactoryGirl.define do
  factory :movie, :class => Refinery::Contest::Movie do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

