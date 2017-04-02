class CreateGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :grupos do |t|
      t.belongs_to :produto, foreign_key: true
      t.references :especialidade, foreign_key: true

      t.timestamps
    end
  end
end
