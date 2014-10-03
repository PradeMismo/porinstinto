class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :photo_category

      t.timestamps
    end
  end
end
