class AddProdutoIdToProduto < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :produto, foreign_key: true
  end
end
