class CreateWallposts < ActiveRecord::Migration[5.1]
  def change
    create_table :wallposts do |t|
      t.text :message
      t.integer :user_id
      t.integer :custom_id
      t.timestamps
    end
  end
end
