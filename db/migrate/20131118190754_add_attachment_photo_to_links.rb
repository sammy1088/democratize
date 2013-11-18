class AddAttachmentPhotoToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :links, :photo
  end
end
