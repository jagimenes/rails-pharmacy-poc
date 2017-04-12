class AddVeiculoToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_reference :manipulados, :veiculo, foreign_key: true
  end
end
