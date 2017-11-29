class AddNameToFavourites < ActiveRecord::Migration[5.1]
  def change
    add_column :favourites, :name, :text
  end
end
