class CreateServices < ActiveRecord::Migration
  def up
    create_table :services do |t|
      t.string :name
      t.integer :rate
      t.integer :hotspot_id
      t.timestamps
    end
  end
  def down
    drop_table :services
  end
end
