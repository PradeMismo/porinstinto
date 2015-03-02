class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :name
      t.string :email
      t.integer :province
      t.text :comment
      t.timestamps
    end
    add_index :votes, :province

    create_table :songs_votes, id: false do |t|
      t.belongs_to :song, index: true
      t.belongs_to :vote, index: true
    end
  end
end
