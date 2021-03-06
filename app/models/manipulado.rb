class Manipulado < ApplicationRecord
  belongs_to :pedido
  belongs_to :formula
  belongs_to :especialidade, optional: true
  belongs_to :veiculo, optional: true
  belongs_to :unidade, optional: true
  has_many   :pontos,  inverse_of: :manipulado, :dependent => :delete_all
  accepts_nested_attributes_for :pontos, :reject_if => :all_blank, :allow_destroy => true
end
