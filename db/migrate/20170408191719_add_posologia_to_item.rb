class AddPosologiaToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :posologia, :string
  end
end
