class CreatePermissaos < ActiveRecord::Migration[5.0]
  def change
    create_table :permissaos do |t|
      t.belongs_to :user, foreign_key: true
      t.references :especialidade, foreign_key: true

      t.timestamps
    end
  end
end
