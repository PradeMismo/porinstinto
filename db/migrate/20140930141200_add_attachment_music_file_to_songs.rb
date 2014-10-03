class AddAttachmentMusicFileToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :music_file
      t.string :url
    end
  end

  def self.down
    remove_attachment :songs, :music_file
  end
end
