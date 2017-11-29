class UpdateToasterImageDefault < ActiveRecord::Migration[5.1]
  def up
    change_column :toasters, :image, :text, default: "https://res.cloudinary.com/dyqesnour/image/upload/v1511736720/gen-toaster_xzbukf.jpg"
  end

  def down
    change_column :toasters, :image, :text, default: "gen-toaster.jpg"
  end
end
