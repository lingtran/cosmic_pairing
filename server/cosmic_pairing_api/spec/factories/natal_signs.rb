FactoryBot.define do
  factory :natal_sign, class: "NatalSign" do
    natal_chart { association :natal_chart }
    celestial_sign { association :celestial_sign }
  end
end
