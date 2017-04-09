class RemoveEspecialidadeToItem < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :especialidade, foreign_key: true
  end
end
