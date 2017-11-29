class CreateCustomsFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :customs_favourites, :id => false do |t|
      t.integer :favourite_id
      t.integer :custom_id
    end
  end
end
