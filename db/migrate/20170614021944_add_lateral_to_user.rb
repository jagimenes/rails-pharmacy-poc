class AddLateralToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lateral, :integer
  end
end
