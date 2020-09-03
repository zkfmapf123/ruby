class CreateLessonEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_evals do |t|
      t.integer :lesson_id
      t.integer :user_id
      t.text :comment
      t.integer :goodPoint, default: 0
      t.integer :badPoint, default: 0
      t.integer :views, default: 0
      t.integer :score1, default: 0
      t.integer :score2, default: 0
      t.integer :score3, default: 0
      t.integer :score4, default: 0
      t.timestamps
    end
  end
end
