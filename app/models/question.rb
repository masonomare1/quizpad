class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  has_many :attempted_answers, dependent: :destroy

  validates :question, presence: true, length: { minimum: 10 }
  validates :question_type, presence: true

  accepts_nested_attributes_for :options

  enum question_type: {
    single_select: 1,
    multi_select: 2
  }

  def question_type=(value)
    super value
  rescue ArgumentError => e
    errors.add(:question_type, e)
    super nil
  end

  def correct
    case question_type.to_sym
    when :single_select
      options.correct.first
    when :multi_select
      options.correct
    else
      []
    end
  end
end
