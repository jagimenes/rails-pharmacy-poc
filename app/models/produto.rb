class Produto < ApplicationRecord
	belongs_to :unidade
	validates_presence_of :descricao, :unidade
end
