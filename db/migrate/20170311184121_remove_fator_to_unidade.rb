class RemoveFatorToUnidade < ActiveRecord::Migration[5.0]
  def change
    remove_column :unidades, :fator, :float
  end
end
