class AddQuantidadeVeiculoToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :quantidade_veiculo, :float
  end
end
