FactoryGirl.define do
  factory :user do
    email           { FFaker::Internet.email }
    password_digest { FFaker::Lorem.characters }
  end
end
