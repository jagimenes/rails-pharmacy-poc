class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  belongs_to :unidade
  belongs_to :especialidade
  validate :VerificaUnidadeMedida
  validates_presence_of :produto, :quantidade, :unidade

  
protected
  def VerificaUnidadeMedida
    quantidade_item	        = self.quantidade
    quantidade_produto      = self.produto.maximo
    unidade_item            = self.unidade.unidade
    unidade_produto         = self.produto.unidade.unidade
    fator_produto           = self.produto.unidade.fator
    fator_item	            = self.unidade.fator
    verifica = false
    conversao_unidade_item = quantidade_item * fator_item
    conversao_unidade_produto = quantidade_produto * fator_produto

    unless quantidade_produto.nil?
      if conversao_unidade_item > conversao_unidade_produto
      	verifica = false
      	errors.add(:quantidade, 'Quantidade inválida')
      end
    end
    
    verifica
 end


end
