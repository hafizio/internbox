FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com" }
  sequence(:name) {|n| "user#{n}" }
  sequence(:github_account) {|n| "user#{n}" }
  sequence(:twitter_account) {|n| "user#{n}" }

  factory :user do
    email { generate(:email) }
    name { generate(:name) }
    github_account { generate(:github_account) }
    twitter_account { generate(:twitter_account) }
    password "example12345"
    password_confirmation "example12345"
    mentor_id 1
  end
end
