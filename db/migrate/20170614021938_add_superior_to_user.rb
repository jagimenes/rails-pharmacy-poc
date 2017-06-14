class AddSuperiorToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superior, :integer
  end
end
