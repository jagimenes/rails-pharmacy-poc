class AddPosologiaToManipulado < ActiveRecord::Migration[5.0]
  def change
    add_column :manipulados, :posologia, :string
  end
end
