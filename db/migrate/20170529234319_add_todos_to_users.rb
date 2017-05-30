class AddTodosToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :todos, :boolean
  end
end
