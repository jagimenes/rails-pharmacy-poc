class UpdateVeiculoFormulaController < ApplicationController
  respond_to :json

  def index
    @veiculos = Formula.select('veiculos.id, veiculos.nome').joins(:veiculo).where(' formulas.id = ?  ', params[:formula_id] )
    if @veiculos.length == 0
    	@veiculos = Veiculo.all
    end
    respond_with(@veiculos.sort_by{|e| e[:nome]})
  end


end