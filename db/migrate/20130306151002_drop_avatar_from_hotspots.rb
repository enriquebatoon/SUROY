class DropAvatarFromHotspots < ActiveRecord::Migration
  def up
  	remove_column :hotspots, :avatar
  end

  def down
  end
end
