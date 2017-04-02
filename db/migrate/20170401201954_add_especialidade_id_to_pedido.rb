class AddEspecialidadeIdToPedido < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :especialidade, foreign_key: true
  end
end
