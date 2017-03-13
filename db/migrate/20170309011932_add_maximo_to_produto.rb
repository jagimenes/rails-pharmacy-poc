class AddMaximoToProduto < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :maximo, :float
  end
end
