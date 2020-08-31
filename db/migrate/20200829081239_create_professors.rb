class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :name, unique: true
      t.string :major
      t.string :image_url
      t.float :score
      t.timestamps
    end
  end
end
