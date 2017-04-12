class AddQuantidadeVeiculoToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_column :manipulados, :quantidade_veiculo, :float
  end
end
