class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :publish_date
      t.text :content
      t.string :youtube_link
      t.string :external_link
      t.references :tag

      t.timestamps
    end
  end
end
