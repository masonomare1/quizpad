json.id @attempt.hashid
json.status @attempt.status
json.total_points @attempt.total_points
json.points_scored @attempt.points_scored
json.candidate @attempt.user.email
json.no_of_questions @attempt.attempted_answers.count

json.pending_questions do
  json.array! @attempt.attempted_answers.pending.map(&:question) do |answer|
    json.question answer.question
    json.solve api_v1_quiz_attempt_solve_path(@attempt.hashid, answer.hashid)

    json.options do
      json.array! answer.options.map(&:description)
    end
  end 
end