class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    t.string :name
    t.date :publish_date
    t.text :description
    t.string :download_link
    t.boolean :own

      t.timestamps
    end
  end
end
