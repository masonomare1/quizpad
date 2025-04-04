class CreateQuizAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_attempts do |t|
      t.integer  :status, default: 0
      t.integer  :total_points
      t.datetime :started_on
      t.float    :points_scored, default: 0

      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
