class CreateHomeworkUserFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :homework_user_flags do |t|
      t.integer :comment_id
      t.integer :user_id
      t.boolean :point_flag, default: true
      t.timestamps
    end
  end
end
