json.array! @questions do |question|
  json.id question.hashid
  json.question question.question
  json.question_type question.question_type
  json.url api_v1_question_path(question.hashid)
end