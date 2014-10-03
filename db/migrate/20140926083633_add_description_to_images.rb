class AddDescriptionToImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.string :description
    end
  end
end
