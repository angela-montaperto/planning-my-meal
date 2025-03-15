FactoryBot.define do
  password = Faker::Internet.password
  factory :user do
    name { 'John' }
    surname { 'Doe' }
    email { Faker::Internet.email }
    role { 'user' }
    password { password }
    password_confirmation { password }
    confirmed_at { Time.now }
    privacy { '1' }

    trait :admin do
      role { 'admin' }
    end

    trait :manager do
      role { 'manager' }
    end

    factory :admin_user, traits: [ :admin ]
    factory :manager, traits: [ :manager ]
  end
end
