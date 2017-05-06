class AddEditarToFormula < ActiveRecord::Migration[5.0]
  def change
    add_column :formulas, :editar, :boolean
  end
end
