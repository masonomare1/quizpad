class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :quiz_attempts, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :status, presence: true

  accepts_nested_attributes_for :questions

  enum status: {
    draft: 0,
    published: 1,
    archived: 2
  }

  def status=(value)
    super value
  rescue ArgumentError => e
    errors.add(:status, e)
    super nil
  end

end
