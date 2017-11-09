class CreateUpgrades < ActiveRecord::Migration[5.1]
  def change
    create_table :upgrades do |t|
      t.string :transaction_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
