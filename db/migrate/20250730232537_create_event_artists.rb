class CreateEventArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :event_artists do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
