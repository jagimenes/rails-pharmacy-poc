class CreateManipulados < ActiveRecord::Migration[5.0]
  def change
    create_table :manipulados do |t|
      t.belongs_to :pedido, foreign_key: true
      t.references :formula, foreign_key: true
      t.float :quantidade

      t.timestamps
    end
  end
end
