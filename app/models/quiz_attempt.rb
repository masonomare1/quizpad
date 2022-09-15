class QuizAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :attempted_answers, dependent: :destroy
  has_many :questions, through: :quiz

  validates :user, uniqueness: { scope: :quiz, message: "you're already enrolled for this Quiz"}
  validates :status, presence: true

  before_save :add_total_points
  after_save :create_attempted_answers

  enum status: {
    in_progress: 0,
    completed: 1
  }

  def status=(value)
    super value
  rescue ArgumentError => e
    errors.add(:status, e)
    super nil
  end

  private

  def add_total_points
    self.total_points = questions.count
  end

  def create_attempted_answers
    questions.each { |question| attempted_answers.create(question: question) }
  end
end
