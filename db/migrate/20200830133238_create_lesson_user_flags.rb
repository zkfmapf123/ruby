class CreateLessonUserFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_user_flags do |t|
      t.integer :lesson_id
      t.integer :user_id
      t.boolean :point_flag, default: true
      t.boolean :favorite_flag, default: true
      t.timestamps
    end
  end
end
