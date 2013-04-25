class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :name
      t.string :description
      t.string :location
      t.integer :company_id
      

      t.timestamps
    end
  end
end
