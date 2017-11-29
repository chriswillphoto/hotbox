class AddImageToToasters < ActiveRecord::Migration[5.1]
  def change
    add_column :toasters, :image, :text
  end
end
