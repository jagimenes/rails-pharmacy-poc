class AddTelefoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :telefone, :string
  end
end
