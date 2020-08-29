class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :major
      t.string :image_url
      t.timestamps
    end
  end
end
