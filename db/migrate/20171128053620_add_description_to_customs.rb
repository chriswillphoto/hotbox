class AddDescriptionToCustoms < ActiveRecord::Migration[5.1]
  def change
    add_column :customs, :description, :text
  end
end
