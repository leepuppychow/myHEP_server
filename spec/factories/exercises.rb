FactoryBot.define do
  factory :exercise do
    sequence(:name) {|n| "Exercise#{n}"}
    sequence(:image) {|n| "www.image#{n}.com"}
    sequence(:description) {|n| "exercise description#{n}"}
  end
end
