class AddShopLinkToRecord < ActiveRecord::Migration
  def change
    add_column :records, :shop_link, :string
  end
end
