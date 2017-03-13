class AddUnidadeIdToProduto < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :unidade, foreign_key: true
  end
end
