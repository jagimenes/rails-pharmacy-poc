class UpdateIngredientesController < ApplicationController
  respond_to :json

  def index
	if params[:formula_id].size > 0
		@ingredientes = Ingrediente.select('ingredientes.produto_id AS produto_id, 
											produtos.descricao as produto_descricao,
											ingredientes.unidade_id AS unidade_id,
											unidades.unidade as unidade,
											formulas.editar as editar,
											ingredientes.quantidade').joins(:unidade).joins(:formula).joins(:produto).where('ingredientes.formula_id = ?', params[:formula_id])
		respond_with(@ingredientes)
	end
  end
end