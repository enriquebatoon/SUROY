class CreateMemberComments < ActiveRecord::Migration
  def up
  create_table :member_remarks, :id => false do |t|
  		t.integer :remarks_id
  		t.integer :member_id
  	end
  	add_index :member_remarks, :remarks_id
  	add_index :member_remarks, :member_id

  	remove_column :remark, :members

  end
  	
  def down
  	add_column :remark, :members, :string
  	drop_table :member_remarks
  end
end
