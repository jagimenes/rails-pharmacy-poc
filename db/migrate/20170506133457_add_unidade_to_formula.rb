class AddUnidadeToFormula < ActiveRecord::Migration[5.0]
  def change
    add_reference :formulas, :unidade, foreign_key: true
  end
end
