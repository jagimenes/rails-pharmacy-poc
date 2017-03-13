class CreateUnidades < ActiveRecord::Migration[5.0]
  def change
    create_table :unidades do |t|
      t.string :unidade
      t.string :descricao

      t.timestamps
    end
  end
end
