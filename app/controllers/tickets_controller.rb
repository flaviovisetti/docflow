class TicketsController < ApplicationController
  before_action :valid_ticket, only: [:show]

  def new
    @line_user = set_line_user
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(set_params)
    if @ticket.save
      redirect_to @ticket
    else
      @line_user = set_line_user
      flash.now[:alert] = 'Não é possível registrar o ticket'
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @current_user = set_line_user
  end

  private

  def valid_ticket
    user = set_line_user
    @ticket = Ticket.find(params[:id])

    validar = TicketsPolicies.new(user, @ticket)
    if validar.own_ticket?(current_person.email)
      @current_user = set_line_user
      render :show
    else
      redirect_to user_path(user.id)
    end
  end

  def set_line_user
    User.where(person_id: current_person.id).first
  end

  def set_params
    params.require(:ticket).permit(:title, :description, :recipient,
                                   :user_id, :attach)
  end
end
