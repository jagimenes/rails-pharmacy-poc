class RemoveEspecialidadeToPedido < ActiveRecord::Migration[5.0]
  def change
    remove_reference :pedidos, :especialidade, foreign_key: true
  end
end
