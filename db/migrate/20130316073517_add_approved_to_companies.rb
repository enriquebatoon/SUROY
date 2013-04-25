class AddApprovedToCompanies < ActiveRecord::Migration
  def up
  	add_column :companies, :approved, :integer
  end

  def down
  	remove_column :companies, :approved
  end
end
