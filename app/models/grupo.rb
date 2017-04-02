class Grupo < ApplicationRecord
  belongs_to :produto
  belongs_to :especialidade
end
