class Pedido < ApplicationRecord
	belongs_to :user
	has_many :items, inverse_of: :pedido
	has_many :manipulados, inverse_of: :pedido
	accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :manipulados, :reject_if => :all_blank, :allow_destroy => true
	validates_presence_of :paciente
	has_one :item
end
 