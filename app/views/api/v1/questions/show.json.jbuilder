json.id @question.hashid
json.question @question.question
json.question_type @question.question_type
json.url api_v1_question_path(@question.hashid)

json.options do
  json.array! @question.options do |option|
    json.id option.hashid
    json.description option.description
    json.url api_v1_option_path(option.hashid)
  end
end