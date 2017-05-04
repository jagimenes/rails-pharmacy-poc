class UpdateFormulasController < ApplicationController
  respond_to :json

  def index
    @formulas = Formula.where('especialidade_id = ?', params[:especialidade_id])
    respond_with(@formulas.sort_by{|e| e[:nome]})
  end


end