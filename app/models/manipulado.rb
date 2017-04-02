class Manipulado < ApplicationRecord
  belongs_to :pedido
  belongs_to :formula
  belongs_to :especialidade
end
