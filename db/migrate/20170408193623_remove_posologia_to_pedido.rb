class RemovePosologiaToPedido < ActiveRecord::Migration[5.0]
  def change
    remove_column :pedidos, :posologia, :string
  end
end
