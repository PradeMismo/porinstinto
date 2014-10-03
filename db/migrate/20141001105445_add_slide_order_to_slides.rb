class AddSlideOrderToSlides < ActiveRecord::Migration
  def change
    change_table :slides do |t|
      t.integer :slide_order
    end
  end
end
