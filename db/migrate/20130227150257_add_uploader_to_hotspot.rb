class AddUploaderToHotspot < ActiveRecord::Migration
  def up
  		add_column :hotspots, :avatar, :string
  end
  def down
  		remove_column :hotspots, :avatar
  end
end
