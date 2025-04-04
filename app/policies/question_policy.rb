class QuestionPolicy < ApplicationPolicy

  def create?
    record.quiz.user == user
  end

  def show?
    record.quiz.published? ? true : record.quiz.user == user 
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
