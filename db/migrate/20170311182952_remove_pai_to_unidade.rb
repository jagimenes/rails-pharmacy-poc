class RemovePaiToUnidade < ActiveRecord::Migration[5.0]
  def change
    remove_column :unidades, :pai, :integer
  end
end
