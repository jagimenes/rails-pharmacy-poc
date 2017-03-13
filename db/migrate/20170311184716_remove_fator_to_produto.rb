class RemoveFatorToProduto < ActiveRecord::Migration[5.0]
  def change
    remove_column :produtos, :fator, :float
  end
end
