class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      
      t.datetime :date
      t.string :place
      t.string :concert_hall
      t.string :tickets
      t.string :bands
      t.string :notes
      t.string :event_link
      t.string :ticket_link

      t.timestamps
    end
  end
end
