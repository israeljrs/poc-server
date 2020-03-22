FactoryBot.define do
  factory :user do
    nome { Faker::Name.name }
    cpf { Faker::CPF.number }
    email { Faker::Internet.email }
  end
end
