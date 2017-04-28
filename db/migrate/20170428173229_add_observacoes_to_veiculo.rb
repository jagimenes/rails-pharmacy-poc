class AddObservacoesToVeiculo < ActiveRecord::Migration[5.0]
  def change
    add_column :veiculos, :observacoes, :string
  end
end
