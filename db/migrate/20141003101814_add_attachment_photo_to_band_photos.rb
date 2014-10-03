class AddAttachmentPhotoToBandPhotos < ActiveRecord::Migration
  def self.up
    change_table :band_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :band_photos, :photo
  end
end
