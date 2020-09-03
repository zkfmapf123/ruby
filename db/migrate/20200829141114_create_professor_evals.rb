class CreateProfessorEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_evals do |t|
      t.integer :professor_id     #교수id
      t.integer :user_id          #userId
      t.text :comment             #코맨트
      t.integer :goodPoint, default: 0        #공감
      t.integer :badPoint, default: 0         #공감X
      t.integer :views, default: 0            #조회수
      t.integer :score1, default: 0             # 점수1
      t.integer :score2, default: 0             # 점수2
      t.integer :score3, default: 0             # 점수3
      t.integer :score4, default: 0             # 점수4
      t.timestamps
    end
  end
end
