class Ponto < ApplicationRecord
  belongs_to :manipulado
  belongs_to :produto
  belongs_to :unidade
end
