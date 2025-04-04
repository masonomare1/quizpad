class Option < ApplicationRecord
  belongs_to :question

  validates :description, presence: true

  scope :correct, -> { where(correct: true) }
end
