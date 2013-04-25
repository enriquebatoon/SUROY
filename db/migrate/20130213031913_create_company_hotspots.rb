class CreateCompanyHotspots < ActiveRecord::Migration
  def up
  	create_table :company_hotspots, :id => false do |t|
  		t.integer :company_id
  		t.integer :hotspot_id
  	end
  	add_index :company_hotspots, :company_id
  	add_index :company_hotspots, :hotspot_id

  	remove_column :companies, :hotspots
  end

  def down

  	add_column :companies, :hotspots, :string
  	drop_table :company_hotspots
  end
end
