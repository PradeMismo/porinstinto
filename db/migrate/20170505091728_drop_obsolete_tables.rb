class DropObsoleteTables < ActiveRecord::Migration
  def change
    drop_table :votes if ActiveRecord::Base.connection.table_exists? :votes
    drop_table :contacts if ActiveRecord::Base.connection.table_exists? :contacts    
  end
end
