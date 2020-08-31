class CreateProfessorEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_evals do |t|
      t.integer :professor_id
      t.integer :user_id
      t.text :comment
      t.integer :goodPoint #공감
      t.integer :badPoint #공감X
      t.integer :views #조회수
      t.float :score1 #
      t.float :score2
      t.float :score3
      t.float :score4
      t.timestamps
    end
  end
end
