class Manipulado < ApplicationRecord
  belongs_to :pedido
  belongs_to :formula
  belongs_to :especialidade
  belongs_to :veiculo
  belongs_to :unidade
end
