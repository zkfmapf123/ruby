class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.integer :lesson_evals_id
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :image_upload
      t.string :file_upload
      # 유저랑 코멘트를 적는 has_many
      t.timestamps
    end
  end
end
