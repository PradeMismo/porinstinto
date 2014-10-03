class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
