class AddUnidadeIdToUnidade < ActiveRecord::Migration[5.0]
  def change
    add_reference :unidades, :unidade, foreign_key: true
  end
end
