FactoryGirl.define do
  factory :model do
    # user
    title { Faker::Company.name }

    # factory :dashboard_with_zones do
    #   zones do
    #     5.times.map{ FactoryGirl.create(:zones) }
    #   end
    # end
  end
end