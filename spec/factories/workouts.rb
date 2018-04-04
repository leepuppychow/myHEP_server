FactoryBot.define do
  factory :workout do
    sequence(:name) {|n| "Workout#{n}"}
    sequence(:therapist) {|n| "Therapist#{n}"}
    status 0
  end
end
