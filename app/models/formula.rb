class Formula < ApplicationRecord
	has_many :ingredientes, inverse_of: :formula
	validates_presence_of :nome
	has_one :ingrediente
	belongs_to :especialidade
	accepts_nested_attributes_for :ingredientes, :reject_if => :all_blank, :allow_destroy => true

end
