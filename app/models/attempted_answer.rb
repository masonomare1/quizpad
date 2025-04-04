class AttemptedAnswer < ApplicationRecord
  after_update :update_attempt_quiz

  belongs_to :quiz_attempt
  belongs_to :question

  validates :status, presence: true

  enum status: {
    pending: 0,
    solved: 1,
    skipped: 2
  }

  def status=(value)
    super value
  rescue ArgumentError => e
    errors.add(:status, e)
    super nil
  end

  def mark_solved(points)
    update(
      status: :solved,
      points: points
    )
  end

  private

  def update_attempt_quiz
    return unless saved_change_to_points?

    quiz_attempt.points_scored += points
    quiz_attempt.save
  end
end
