FactoryBot.define do
  factory :celestial, class: "Celestial" do
    name { Faker::Space.planet }
    type { "Planet" }
  end
end
