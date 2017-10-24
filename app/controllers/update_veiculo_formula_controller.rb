class UpdateVeiculoFormulaController < ApplicationController
  respond_to :json

  def index
    @veiculos = Formula.select('veiculos.id, veiculos.nome, formulas.quantidade, (select unidades.id from unidades where unidade_id = formulas.unidade_id) as veiculo_id, (select unidades.unidade from unidades where unidade_id = formulas.unidade_id) as veiculo_unidade ').joins(:veiculo).where(' formulas.id = ?  ', params[:formula_id] ).distinct
    if @veiculos.length == 0
    	@veiculos = Veiculo.select('id, nome, 0 as quantidade, 0 as veiculo_unidade, 0 as veiculo_id').all.distinct
    end
    respond_with(@veiculos.sort_by{|e| e[:nome]})
  end


end