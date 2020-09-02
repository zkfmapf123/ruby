class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :name, unique: true #교수이름
      t.string :major              #교수전공
      t.string :image_url          #교수이미지
      t.float :score               #교수점수
      t.timestamps
    end
  end
end
