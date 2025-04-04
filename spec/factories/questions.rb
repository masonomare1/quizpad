FactoryBot.define do
  factory :question do
    association :quiz, factory: :quiz
    question { Faker::Lorem.sentence(word_count: rand(10..20)).chomp('.').concat('?') }

    question_type { 'single_select' }
  end

  factory :question_with_single_select, parent: :question do
    question_type { 'single_select' }

    after(:create) do |question|
      question.options do
        create_list(:option, 3, question: question)
        create_list(:option, 1, correct: true, question: question)
      end
    end
  end

  factory :question_with_multiple_select, parent: :question do
    question_type { 'multi_select' }

    after(:create) do |question|
      create_list(:option, 2, question: question)
      create_list(:option, 3, correct: true, question: question)
    end
  end
end
