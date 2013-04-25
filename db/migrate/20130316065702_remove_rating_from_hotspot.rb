class RemoveRatingFromHotspot < ActiveRecord::Migration
  def up
  	remove_column :hotspots, :rating
  end

  def down
  end
end
