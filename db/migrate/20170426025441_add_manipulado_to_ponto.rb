class AddManipuladoToPonto < ActiveRecord::Migration[5.0]
  def change
    add_reference :pontos, :manipulado, foreign_key: true
  end
end
