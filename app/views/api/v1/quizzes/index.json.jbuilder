
json.status "success"
json.data do
    json.array! @quizzes do |quiz|
    json.id quiz.hashid
    json.name quiz.name
    json.status quiz.status
    json.user_id quiz.user.hashid
    json.url api_v1_quiz_path(quiz.hashid)
  end
end