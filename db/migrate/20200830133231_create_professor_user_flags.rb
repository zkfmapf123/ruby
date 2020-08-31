class CreateProfessorUserFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_user_flags do |t|
      t.integer :professor_id
      t.integer :user_id
      t.boolean :favorite_flag
      t.timestamps
    end
  end
end
