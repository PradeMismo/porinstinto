class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    t.string :name
    t.text :lyrics
    t.integer :track_order
    t.references :record

    t.timestamps
    end
  end
end
