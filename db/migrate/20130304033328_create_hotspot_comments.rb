class CreateHotspotComments < ActiveRecord::Migration
  def up
  	create_table :hotspot_remarks, :id => false do |t|
  		t.integer :remarks_id
  		t.integer :hotspot_id
  	end
  	add_index :hotspot_remarks, :remarks_id
  	add_index :hotspot_remarks, :hotspot_id

  	remove_column :remark, :hotspots

  end
  	
  def down
  	add_column :remark, :hotspots, :string
  	drop_table :hotspot_remarks
  end
end
