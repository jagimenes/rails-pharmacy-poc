class AddUserIdToPedido < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :user, foreign_key: true
  end
end
