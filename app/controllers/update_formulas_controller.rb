class UpdateFormulasController < ApplicationController
  respond_to :json

  def index
    @formulas = Formula.where(' (user_id = ? OR user_id = 0) AND especialidade_id = ?', current_user.id, params[:especialidade_id])
    respond_with(@formulas.sort_by{|e| e[:nome]})
  end


end