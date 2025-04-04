class CreateAttemptedAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :attempted_answers do |t|
      t.references :quiz_attempt, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.float :points
      t.integer :status, default: 0
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
