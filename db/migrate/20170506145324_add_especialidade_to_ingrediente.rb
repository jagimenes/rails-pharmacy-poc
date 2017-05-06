class AddEspecialidadeToIngrediente < ActiveRecord::Migration[5.0]
  def change
    add_reference :ingredientes, :especialidade, foreign_key: true
  end
end
