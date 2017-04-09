class RemoveEspecialidadeIdToManipulado < ActiveRecord::Migration[5.0]
  def change
    remove_reference :manipulados, :especialidade, foreign_key: true
  end
end
