class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :home_url
      t.string :sc_url
      t.string :am_url
      t.string :sp_url

      t.timestamps
    end
  end
end
