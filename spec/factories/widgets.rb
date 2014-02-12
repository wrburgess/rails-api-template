FactoryGirl.define do
  factory :widget do
    user
    title { Faker::Company.name }
  end
end
