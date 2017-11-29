class AddDefaultToRatingAndRatings < ActiveRecord::Migration[5.1]
  def up
    change_column :toasters, :rating, :float, default: 0
    change_column :toasters, :ratings, :integer, default: 0
  end

  def down
    change_column :toasters, :rating, :float, default: nil
    change_column :toasters, :ratings, :integer, default: nil
  end
end
