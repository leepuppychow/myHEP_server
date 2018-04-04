FactoryBot.define do
  factory :weekday do
    sequence(:name) {|n| "Day#{n}"}
    workout 
  end
end
