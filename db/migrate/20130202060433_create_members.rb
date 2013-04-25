class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :email
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.integer :user_type
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
