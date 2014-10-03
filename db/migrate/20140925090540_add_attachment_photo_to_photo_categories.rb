class AddAttachmentPhotoToPhotoCategories < ActiveRecord::Migration
  def self.up
    change_table :photo_categories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :photo_categories, :photo
  end
end
