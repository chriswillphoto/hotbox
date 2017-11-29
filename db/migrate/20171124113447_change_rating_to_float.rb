class ChangeRatingToFloat < ActiveRecord::Migration[5.1]
  def change
    change_table :toasters do |t|
      t.change :rating, :float
    end
  end
end
