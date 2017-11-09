class AddDefaultReadToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :read, :boolean, default: false
  end
end
