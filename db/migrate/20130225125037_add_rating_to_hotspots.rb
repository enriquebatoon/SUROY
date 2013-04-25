class AddRatingToHotspots < ActiveRecord::Migration
  def up
  		add_column :hotspots, :rating, :integer
  end
  def down
  		remove_column :hotspots, :rating
  end
end
