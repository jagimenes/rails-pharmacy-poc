class AddSinonimoToProduto < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :sinonimo, :string
  end
end
