class CreateBandPhotos < ActiveRecord::Migration
  def change
    create_table :band_photos do |t|

      t.timestamps
    end
  end
end
