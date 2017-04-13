class Diluente < ApplicationRecord
  belongs_to :produto
  belongs_to :veiculo
end
