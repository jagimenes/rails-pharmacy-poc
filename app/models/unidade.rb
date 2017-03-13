class Unidade < ApplicationRecord
	belongs_to :pai
	validates_presence_of :unidade, :descricao, :pai, :fator
end
