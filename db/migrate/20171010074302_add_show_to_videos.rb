class AddShowToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :show, :boolean, default: false
  end
end
