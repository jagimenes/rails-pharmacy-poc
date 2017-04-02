class AddEspecialidadeIdToFormula < ActiveRecord::Migration[5.0]
  def change
    add_reference :formulas, :especialidade, foreign_key: true
  end
end
