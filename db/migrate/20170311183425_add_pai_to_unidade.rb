class AddPaiToUnidade < ActiveRecord::Migration[5.0]
  def change
    add_reference :unidades, :pai, foreign_key: true
  end
end
