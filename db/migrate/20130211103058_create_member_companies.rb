class CreateMemberCompanies < ActiveRecord::Migration
  def up
  	create_table :member_companies, :id => false do|t|
  		t.integer :member_id
  		t.integer :company_id
  	end

  	add_index :member_companies, :member_id
  	add_index :member_companies, :company_id

  	


  def down
  	add_column :members, :companies, :string
  	drop_table :member_companies
  end
end
