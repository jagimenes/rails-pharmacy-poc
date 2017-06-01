class Ingrediente < ApplicationRecord
  belongs_to        :formula
  belongs_to        :produto
  belongs_to        :unidade
  belongs_to        :especialidade, optional: true
  validate :VerificaUnidadeMedida
  validates_presence_of :produto, :quantidade, :unidade

protected
  def VerificaUnidadeMedida
    quantidade_formula      = self.quantidade
    quantidade_produto      = self.produto.maximo
    unidade_formula         = self.unidade.unidade
    unidade_produto         = self.produto.unidade.unidade
    fator_produto           = self.produto.unidade.fator
    fator_formula           = self.unidade.fator
    verifica = false
    conversao_unidade_formula = quantidade_formula * fator_formula
    conversao_unidade_produto = quantidade_produto * fator_produto

    unless quantidade_produto.nil?
      if conversao_unidade_formula > conversao_unidade_produto
      	verifica = false
      	errors.add(:quantidade, 'Quantidade inválida')
      end
    end

    verifica 
 end



end


