class CreateProfessorEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_evals do |t|
      t.integer :professor_id     #교수id
      t.integer :user_id          #userId
      t.text :comment             #코맨트
      t.integer :goodPoint        #공감
      t.integer :badPoint         #공감X
      t.integer :views            #조회수
      t.float :score1             # 점수1
      t.float :score2             # 점수2
      t.float :score3             # 점수3
      t.float :score4             # 점수4
      t.timestamps
    end
  end
end
