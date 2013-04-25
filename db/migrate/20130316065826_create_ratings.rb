class CreateRatings < ActiveRecord::Migration
  def up
  	create_table :ratings do |t|
      t.integer :rating
      t.integer :hotspot_id
      t.integer :member_id

      t.timestamps
    end
  end

  def down
    drop_table :ratings
  end
end
