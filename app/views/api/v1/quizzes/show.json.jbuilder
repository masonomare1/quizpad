json.status "success"
json.data do
  json.id @quiz.hashid
  json.name @quiz.name
  json.status @quiz.status
  json.user_id @quiz.user.hashid
  json.url api_v1_quiz_path(@quiz.hashid)

  json.questions do
    json.array! @quiz.questions, :question do |question|
      json.question question.question
      json.question_type question.question_type
      json.options do
        json.array! question.options.map(&:description)
      end
    end
  end
end

