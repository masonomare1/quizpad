FactoryBot.define do
  factory :option do

    description { Faker::Lorem.sentence(word_count: rand(2..10)).chomp('.') }
    correct { false }

    trait :with_question do
      association :question, factory: :question
    end
  end
end
