FactoryGirl.define do
  factory :user do
    email    { FFaker::Internet.email }
    password { 'password' }
    role     { %w(admin customer agent).sample }
  end

  trait :admin do
    role 'admin'
  end

  trait :customer do
    role 'customer'
  end

  trait :agent do
    role 'agent'
  end
end
