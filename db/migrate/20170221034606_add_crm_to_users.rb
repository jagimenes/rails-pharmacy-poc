class AddCrmToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :crm, :string
  end
end
