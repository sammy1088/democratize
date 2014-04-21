class AddAttachmentPhotoToAds < ActiveRecord::Migration
  def self.up
    change_table :ads do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :ads, :photo
  end
end