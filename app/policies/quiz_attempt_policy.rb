class QuizAttemptPolicy < ApplicationPolicy
  def create?
    not policy(record.quiz).update?
  end

  def solve?
    record.user == user
  end
end
