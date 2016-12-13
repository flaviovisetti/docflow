class UsersController < ApplicationController
  before_action :authenticate_person!
  before_action :set_param_user, only: [:show]
  before_action :user_recipient_tickets, only: [:show]

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
    @user = set_param_user
    @others_ticket = user_recipient_tickets
  end

  private

  def set_params
    params.require(:user).permit(:name, :phone, :birthdate, :person_id)
  end

  def user_recipient_tickets
    Ticket.where(recipient: current_person.email)
  end

  def set_param_user
    User.find(params[:id])
  end
end
