FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    password "password"
  end

  factory :group do
    name{ Faker::Lorem.word}
    content{Faker::Lorem.paragraph}
  end

end
