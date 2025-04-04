class OptionPolicy < ApplicationPolicy
  def create?
    record.question.quiz.user == user
  end

  def show?
    record.question.quiz.published? ? true : record.quiz.user == user
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
