class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.integer :lesson_evals_id
      t.integer :user_id
      t.string :title           #과제공유 글 제목
      t.string :description     #과제공유 설명
      t.string :image_upload    # imageUpload aws s3 Carrierwave
      t.string :file_upload     # fileUpload aws s3 Carrierwave
      # 유저랑 코멘트를 적는 has_many
      t.timestamps
    end
  end
end
