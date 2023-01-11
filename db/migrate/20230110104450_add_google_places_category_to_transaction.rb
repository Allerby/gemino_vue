class AddGooglePlacesCategoryToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :google_places_category, :string
  end
end
