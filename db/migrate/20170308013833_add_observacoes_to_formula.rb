class AddObservacoesToFormula < ActiveRecord::Migration[5.0]
  def change
    add_column :formulas, :observacoes, :string
  end
end
