class AddDescriptionToToasters < ActiveRecord::Migration[5.1]
  def change
    add_column :toasters, :description, :text
  end
end
