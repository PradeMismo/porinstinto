class DropOrdersTable < ActiveRecord::Migration
  def change
    drop_table :orders if ActiveRecord::Base.connection.table_exists? :orders
  end
end
