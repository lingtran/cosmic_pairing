FactoryBot.define do
  factory :sun, class: "Sun" do
    name { Faker::Space.star }
  end
end
