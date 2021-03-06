class UpdateVeiculoFormulaController < ApplicationController
  respond_to :json

  def index
	  if params[:formula_id].size > 0
		@veiculos = Formula.select('veiculos.id, veiculos.nome, formulas.quantidade, unidades.id as veiculo_id, unidades.unidade as veiculo_unidade ').joins(:veiculo).joins(:unidade).where(' formulas.id = ?  ', params[:formula_id] ).distinct
		if @veiculos.length == 0
			@veiculos = Veiculo.select('id, nome, 0 as quantidade, 0 as veiculo_unidade, 0 as veiculo_id').distinct.all
		end
		respond_with(@veiculos.sort_by{|e| e[:nome]})
	  end
  end


end