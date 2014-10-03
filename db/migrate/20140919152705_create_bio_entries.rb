class CreateBioEntries < ActiveRecord::Migration
  def change
    create_table :bio_entries do |t|
    t.string :title
    t.integer :chapter_order
    t.text :content

      t.timestamps
    end
  end
end
