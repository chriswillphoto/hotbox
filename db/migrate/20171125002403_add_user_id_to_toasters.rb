class AddUserIdToToasters < ActiveRecord::Migration[5.1]
  def change
    add_column :toasters, :user_id, :integer
  end
end
