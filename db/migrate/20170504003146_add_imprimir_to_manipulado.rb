class AddImprimirToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_column :manipulados, :imprimir, :boolean
  end
end
