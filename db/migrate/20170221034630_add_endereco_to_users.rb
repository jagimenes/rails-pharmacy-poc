class AddEnderecoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :endereco, :string
  end
end
