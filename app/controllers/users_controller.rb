class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to @user
    else
      flash.now[:alert] = 'Não possível criar usuário'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def set_params
    params.require(:user).permit(:name, :phone, :birthdate)
  end
end
