class RemoveAtivoFromProdutos < ActiveRecord::Migration[5.0]
  def change
    remove_column :produtos, :ativo, :boolean
  end
end
