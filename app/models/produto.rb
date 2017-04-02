class Produto < ApplicationRecord
	belongs_to :unidade
	has_many :grupos, inverse_of: :produto
	validates_presence_of :descricao, :unidade
	accepts_nested_attributes_for :grupos , :reject_if => :all_blank, :allow_destroy => true
end