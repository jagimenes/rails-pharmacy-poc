class AddEspecialidadeToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :especialidade, foreign_key: true
  end
end
