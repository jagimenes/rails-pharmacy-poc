class RemoveProdutoIdToProduto < ActiveRecord::Migration[5.0]
  def change
    remove_reference :produtos, :produto, foreign_key: true
  end
end
