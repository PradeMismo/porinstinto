class CreateShopItems < ActiveRecord::Migration
  def change
    create_table :shop_items do |t|
      t.string :name
      t.float :price
      t.integer :relevance
      t.attachment :image
      t.text :description
      t.string :external_shop_link

      t.timestamps
    end
  end
end
