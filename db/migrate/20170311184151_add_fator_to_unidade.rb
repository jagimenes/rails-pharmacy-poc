class AddFatorToUnidade < ActiveRecord::Migration[5.0]
  def change
    add_column :unidades, :fator, :float
  end
end
