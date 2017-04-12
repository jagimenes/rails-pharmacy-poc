class AddUnidadeVeiculoToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_reference :manipulados, :unidade, foreign_key: true
  end
end
