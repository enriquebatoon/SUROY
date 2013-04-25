class AddAttachmentPhotoToHotspots < ActiveRecord::Migration
  def self.up
    change_table :hotspots do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :hotspots, :photo
  end
end
