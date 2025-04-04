class QuizPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: :published).or(scope.where(user: user))
    end
  end

  def update?
    user == record.user
  end

  def destroy?
    update?
  end

  def show?
    record.published? ? true : record.user == user 
  end
end
