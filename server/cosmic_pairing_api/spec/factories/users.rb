FactoryBot.define do
  factory :user, class: "User" do
    username { Faker::Creature::Cat.name }
    first_name { Faker::Ancient.hero }
  end
end
