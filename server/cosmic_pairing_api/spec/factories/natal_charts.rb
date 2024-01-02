FactoryBot.define do
  factory :natal_chart do
    user { association :user }
  end
end
