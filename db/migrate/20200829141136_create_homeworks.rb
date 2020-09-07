class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.integer :lesson_id
      t.integer :user_id
      t.string :title           #과제공유 글 제목
      t.text :description     #과제공유 설명
      t.integer :view
      t.string :image   # imageUpload aws s3 Carrierwave
      t.string :file     # fileUpload aws s3 Carrierwave
      t.timestamps
    end
  end
end
