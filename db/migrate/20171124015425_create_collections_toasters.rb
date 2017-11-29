class CreateCollectionsToasters < ActiveRecord::Migration[5.1]
  def change
    create_table :collections_toasters, :id => false do |t|
      t.integer :collection_id
      t.integer :toaster_id
    end
  end
end
