class UpdateFormulasController < ApplicationController
  respond_to :json

  def index
    @formulas = Formula.where('especialidade_id = ?', params[:especialidade_id])
    respond_with(@formulas)
  end


end