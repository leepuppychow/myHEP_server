FactoryBot.define do
  factory :workout do
    sequence(:name) {|n| "Workout#{n}"}
    sequence(:weekday) {|n| "Monday#{n}"}
    sequence(:therapist) {|n| "Therapist#{n}"}
    status 0
  end
end
