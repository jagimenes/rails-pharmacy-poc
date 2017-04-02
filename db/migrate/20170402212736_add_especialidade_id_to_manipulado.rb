class AddEspecialidadeIdToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_reference :manipulados, :especialidade, foreign_key: true
  end
end
