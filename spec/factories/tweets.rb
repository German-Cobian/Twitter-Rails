FactoryBot.define do
  factory :tweet do
    user
    body { Faker::Lorem.paragraphs }
  end
end
