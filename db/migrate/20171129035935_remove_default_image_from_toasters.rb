class RemoveDefaultImageFromToasters < ActiveRecord::Migration[5.1]
  def up
    change_column :toasters, :image, :text, default: nil
  end

  def down
    change_column :toasters, :image, :text, default: "https://res.cloudinary.com/dyqesnour/image/upload/v1511739515/gen-toaster_fg73fj.jpg"
  end
end
