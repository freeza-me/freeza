# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'
    password_confirmation 'password'

    after(:create) do |user|
      user.confirm!
    end
  end
end
