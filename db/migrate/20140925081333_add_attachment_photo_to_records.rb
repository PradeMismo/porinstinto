class AddAttachmentPhotoToRecords < ActiveRecord::Migration
  def self.up
    change_table :records do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :records, :photo
  end
end
