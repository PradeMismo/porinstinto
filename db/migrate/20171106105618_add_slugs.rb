class AddSlugs < ActiveRecord::Migration
  def change
    add_column :records,           :slug, :string, unique: true
    add_column :videos,            :slug, :string, unique: true
    add_column :photo_categories,  :slug, :string, unique: true
    add_column :video_categories,  :slug, :string, unique: true
    Record.find_each(&:save)
    Video.find_each(&:save)
    PhotoCategory.find_each(&:save)
    VideoCategory.find_each(&:save)
  end
end
