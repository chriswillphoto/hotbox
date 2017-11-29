class CreateToasters < ActiveRecord::Migration[5.1]
  def change
    create_table :toasters do |t|
      t.text :model
      t.text :manufacturer
      t.integer :year
      t.numeric :rating
      t.integer :ratings
      t.timestamps
    end
  end
end
