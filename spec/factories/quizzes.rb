FactoryBot.define do
  factory :quiz do
    association :user, factory: :user

    name { Faker::Name.name }
    status { 'published' }
  end

  factory :quiz_with_questions, parent: :quiz do

    transient do
      single_select_questions { 2 }
      multi_select_questions { 3 }
    end

    after(:create) do |quiz, evaluator|
      quiz.questions do
        create_list(:question_with_single_select, evaluator.single_select_questions, quiz: quiz)
        create_list(:question_with_multiple_select, evaluator.multi_select_questions, quiz: quiz)
      end
    end
  end
end
