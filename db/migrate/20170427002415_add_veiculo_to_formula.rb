class AddVeiculoToFormula < ActiveRecord::Migration[5.0]
  def change
    add_reference :formulas, :veiculo, foreign_key: true
  end
end
