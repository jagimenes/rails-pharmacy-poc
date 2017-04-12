class AddUnidadeVeiculoToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :unidade_veiculo, references: :unidade, foreign_key: true
  end
end
