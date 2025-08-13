class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :username, null: false
      t.string :email, null: false
      t.date :date_of_birth
      t.string :role, null: false, default: 'user'

      t.index :username, unique: true
      t.index :email, unique: true

      t.timestamps
    end
  end
end
