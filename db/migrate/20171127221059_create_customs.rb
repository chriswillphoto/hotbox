class CreateCustoms < ActiveRecord::Migration[5.1]
  def change
    create_table :customs do |t|
      t.text :name
      t.text :image
      t.text :user_id
      t.text :toaster_id
      t.timestamps
    end
  end
end
