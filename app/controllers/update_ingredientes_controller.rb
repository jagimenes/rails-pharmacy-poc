class UpdateIngredientesController < ApplicationController
  respond_to :json

  def index
    @ingredientes = Ingrediente.select('ingredientes.produto_id AS produto_id, 
    								    produtos.descricao as produto_descricao,
    								    ingredientes.unidade_id AS unidade_id,
    								    unidades.unidade as unidade,
    								    ingredientes.quantidade').joins(:unidade).joins(:formula).joins(:produto).where('ingredientes.formula_id = ?', params[:formula_id])
    respond_with(@ingredientes)
  end
end