class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name                #이름
      t.string :email, unique: true #이메일
      t.string :major               #전공
      t.integer :alert              #신고횟수
      t.string :password_digest
      t.timestamps
    end
  end
end
