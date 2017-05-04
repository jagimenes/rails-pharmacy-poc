class UpdateProdutosController < ApplicationController
  respond_to :json

  def index
    @produtos = Produto.joins(:grupos).where('grupos.especialidade_id = ?', params[:especialidade_id])
    respond_with(@produtos.sort_by{|e| e[:descricao]})
  end


end