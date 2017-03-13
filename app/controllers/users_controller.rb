class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Acesso negado."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "Usuário Atualizado."
    else
      redirect_to users_path, :alert => "Não foi possível atualizar o usuário."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "Usuário removido."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Acesso negado."
    end
  end

  def secure_params
    params.require(:user).permit(:role, :endereco)
  end

end
