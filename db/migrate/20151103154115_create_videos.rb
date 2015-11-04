class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_link
      t.text :description
      t.references :video_category

      t.timestamps
    end
  end
end
