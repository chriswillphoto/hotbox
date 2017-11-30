class AddScoreToToaster < ActiveRecord::Migration[5.1]
  def change
    add_column :toasters, :score, :float, default: 0.0
  end
end
