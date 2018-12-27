class CreateAnswerQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_questions do |t|
      t.integer :answer_id, null: false, foreign_key: { to_table: :messages }
      t.integer :question_id, null: false, foreign_key: { to_table: :messages }

      t.timestamps
    end

    add_index :answer_questions, [:answer_id, :question_id], unique: true
  end
end
