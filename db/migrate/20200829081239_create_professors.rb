class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :name, unique: true #교수이름
      t.string :major              #교수전공
      t.string :image_url          #교수이미지
      t.integer :score, default: 0        #교수점수
      t.integer :view, default: 0
      t.timestamps
    end
  end
end
