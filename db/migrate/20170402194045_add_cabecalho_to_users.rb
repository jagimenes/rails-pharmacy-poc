class AddCabecalhoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cabecalho, :boolean
  end
end
