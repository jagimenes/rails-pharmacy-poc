class RemoveUnidadeIdToUnidade < ActiveRecord::Migration[5.0]
  def change
    remove_reference :unidades, :unidade, foreign_key: true
  end
end
