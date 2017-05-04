class UpdateFormulasVeiculoController < ApplicationController
  respond_to :json

  def index
    @veiculos = Diluente.joins(:veiculo).where('veiculo.produto_id = ?', params[:produto_id])
    respond_with(@veiculos.sort_by{|e| e[:nome]})
  end


end