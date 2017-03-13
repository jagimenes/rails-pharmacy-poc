class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :pedido, foreign_key: true
      t.references :produto, foreign_key: true
      t.references :unidade, foreign_key: true
      t.float :quantidade

      t.timestamps
    end
  end
end
