class CreateLessonEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_evals do |t|
      t.integer :lesson_id
      t.integer :user_id
      t.text :comment
      t.integer :goodPoint
      t.integer :badPoint
      t.integer :views
      t.float :score1
      t.float :score2
      t.float :score3
      t.float :score4
      t.timestamps
    end
  end
end
