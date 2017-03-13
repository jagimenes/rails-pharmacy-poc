class AddFatorToProduto < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :fator, :float
  end
end
