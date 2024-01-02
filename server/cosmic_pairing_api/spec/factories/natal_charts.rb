FactoryBot.define do
  factory :natal_chart, class: "NatalChart" do
    user { association :user }
  end
end
