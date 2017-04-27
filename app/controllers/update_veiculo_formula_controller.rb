class UpdateVeiculoFormulaController < ApplicationController
  respond_to :json

  def index
    @veiculos = Formula.select('veiculos.id, veiculos.nome').joins(:veiculo).where(' formulas.id = ?  ', params[:formula_id] )
    respond_with(@veiculos)
  end


end