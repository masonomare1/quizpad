FactoryBot.define do
  factory :quiz_attempt do
    association :user
    association :quiz

    status { 'in_progress' }
  end
end
