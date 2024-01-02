FactoryBot.define do
  factory :celestial_sign, class: "CelestialSign" do
    celestial { association :celestial, name: Faker::Space.galaxy }
    sign { association :sign, name: Faker::Tea.variety }
    essential_dignity { 0 }
  end
end
