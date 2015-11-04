class CreateVideoCategories < ActiveRecord::Migration
  def change
    create_table :video_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
