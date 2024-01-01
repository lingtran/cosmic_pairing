FactoryBot.define do
    factory :planet, class: "Planet" do
      name { Faker::Space.planet }
    end
  end
  