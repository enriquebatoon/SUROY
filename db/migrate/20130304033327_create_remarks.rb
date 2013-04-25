class CreateRemarks < ActiveRecord::Migration
  def up
    create_table :remarks do |t|
      t.string :remark
      t.integer :hotspot_id
      t.integer :member_id

      t.timestamps
    end
  end
end
