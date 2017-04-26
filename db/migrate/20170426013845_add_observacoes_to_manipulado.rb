class AddObservacoesToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_column :manipulados, :observacoes, :string
  end
end
