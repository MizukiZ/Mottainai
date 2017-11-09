class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :nationality
      t.boolean :premium, default: false
      t.string :city
      t.string :country_code
      t.decimal :latitude, precision:10, scale: 6
      t.decimal :longitude, precision:10, scale: 6
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
