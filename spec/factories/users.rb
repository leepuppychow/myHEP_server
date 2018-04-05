FactoryBot.define do
  factory :user do
    sequence(:first_name) {|n| "Firstname#{n}"}
    sequence(:last_name) {|n| "Lastname#{n}"}
    sequence(:username) {|n| "username#{n}"}
    sequence(:email) {|n| "email#{n}"}
    sequence(:api_token) {|n| "api_token#{n}"}
    sequence(:oauth_token) {|n| "oauth_token#{n}"}
    sequence(:password_digest) {|n| "password_digest#{n}"}
    admin false
  end
end
