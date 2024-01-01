FactoryBot.define do
  factory :sign, class: "Sign" do
    name { Faker::Fantasy::Tolkien.character }
    element { "fire" }
    modality { "mutable" }
  end
end
