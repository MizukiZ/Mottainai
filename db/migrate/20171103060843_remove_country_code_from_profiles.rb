class RemoveCountryCodeFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :country_code, :string
  end
end
