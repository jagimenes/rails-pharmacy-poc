class Permissao < ApplicationRecord
  belongs_to :user
  belongs_to :especialidade
end
