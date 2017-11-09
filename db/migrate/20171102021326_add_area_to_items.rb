class AddAreaToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :area, :string
  end
end
