FactoryBot.define do
  factory :moon, class: "Moon" do
    name { Faker::Space.moon }
  end
end
