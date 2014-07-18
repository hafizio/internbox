FactoryGirl.define do
  factory :admin do
    email "admin_example@example.com"
    name "admin_example"
    github_account "admin_example"
    twitter_account "admin_example"
    password "example12345"
    password_confirmation "example12345"
  end
end
