class CreateHotspotServices < ActiveRecord::Migration
  def up
  	create_table :hotspot_services, :id => false do |t|
  		t.integer :service_id
  		t.integer :hotspot_id
  	end
  	add_index :hotspot_services, :service_id
  	add_index :hotspot_services, :hotspot_id

  	remove_column :services, :hotspots
  end

  def down
  	add_column :services, :hotspots, :string
  	drop_table :hotspot_services
  end
end
