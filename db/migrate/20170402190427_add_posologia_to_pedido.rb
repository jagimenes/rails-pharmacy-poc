class AddPosologiaToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :posologia, :string
  end
end
