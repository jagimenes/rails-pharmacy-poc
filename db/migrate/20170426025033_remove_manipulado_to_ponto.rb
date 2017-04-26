class RemoveManipuladoToPonto < ActiveRecord::Migration[5.0]
  def change
    remove_reference :pontos, :manipulado, foreign_key: true
  end
end
