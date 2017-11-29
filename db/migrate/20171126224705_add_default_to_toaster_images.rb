class AddDefaultToToasterImages < ActiveRecord::Migration[5.1]
  def up
    change_column :toasters, :image, :text, default: "gen-toaster.jpg"
  end

  def down
    change_column :toasters, :image, :text, default: nil
  end
end
