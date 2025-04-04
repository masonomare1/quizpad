json.array! @attempts do |attempt|
  json.id attempt.hashid
  json.status attempt.status
  json.total_points attempt.total_points
  json.points_scored attempt.points_scored
  json.candidate attempt.user.email
  json.no_of_questions attempt.attempted_answers.count
  json.url api_v1_quiz_attempt_path(attempt.hashid)
end