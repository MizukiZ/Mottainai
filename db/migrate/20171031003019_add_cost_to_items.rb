class AddCostToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :cost, :integer
  end
end
