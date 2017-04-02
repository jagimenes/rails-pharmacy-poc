class AddUserIdToFormula < ActiveRecord::Migration[5.0]
  def change
    add_reference :formulas, :user, foreign_key: true
  end
end
