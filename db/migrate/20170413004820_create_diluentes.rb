class CreateDiluentes < ActiveRecord::Migration[5.0]
  def change
    create_table :diluentes do |t|
      t.belongs_to :produto, foreign_key: true
      t.references :veiculo, foreign_key: true

      t.timestamps
    end
  end
end
