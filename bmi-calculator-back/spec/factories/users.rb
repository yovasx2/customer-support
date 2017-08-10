FactoryGirl.define do
  factory :user do
    email           { FFaker::Intenet.email }
    password_digest { FFaker::Lorem.characters }
  end
end
