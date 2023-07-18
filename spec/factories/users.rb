FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    reset_password_token { nil }
    reset_password_sent_at { nil }
    remember_created_at { nil }
  end
end