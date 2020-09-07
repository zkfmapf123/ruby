class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :homework_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :goodPoint, default: 0
      t.integer :badPoint, default: 0
      t.integer :view
      t.string :image
      t.string :file
      t.timestamps
    end
  end
end
