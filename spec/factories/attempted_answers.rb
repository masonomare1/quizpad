FactoryBot.define do
  factory :attempted_answer do
    association :quiz_attempt, factory: :quiz_attempt
    association :question, factory: :question_with_single_select
  end
end
