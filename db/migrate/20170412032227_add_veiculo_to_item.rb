class AddVeiculoToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :veiculo, foreign_key: true
  end
end
