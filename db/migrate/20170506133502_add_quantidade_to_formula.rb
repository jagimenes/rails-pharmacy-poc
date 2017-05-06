class AddQuantidadeToFormula < ActiveRecord::Migration[5.0]
  def change
    add_column :formulas, :quantidade, :float
  end
end
