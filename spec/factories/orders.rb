FactoryBot.define do
  factory :order do
    user { create(:user) }
    model { Faker::Name.name }
    vrl_year { 600.00 }
    num_parcel { 4 }
  end
end
