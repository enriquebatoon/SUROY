class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :member_id

      t.timestamps
    end
  end
end
