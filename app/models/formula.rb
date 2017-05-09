class Formula < ApplicationRecord
	has_many :ingredientes, inverse_of: :formula
	validates_presence_of :nome
	has_one :ingrediente
	belongs_to :especialidade
	belongs_to :veiculo, optional: true
	belongs_to :unidade, optional: true
	accepts_nested_attributes_for :ingredientes, :reject_if => :all_blank, :allow_destroy => true

end
