class AddLinksToRecords < ActiveRecord::Migration
  def change
    change_table :records do |t|
      t.string :youtube_link
      t.string :spotify_link
    end
  end
end
