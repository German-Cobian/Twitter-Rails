FactoryBot.define do
  factory :hashtag do
    tag { Faker::Lorem.word }
  end
end
