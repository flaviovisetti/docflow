class TicketsController < ApplicationController
  before_action :valid_ticket, only: [:show]
  before_action :set_line_user, only: [:new]

  def new
    @line_user = set_line_user
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(set_params)
    @ticket.save

    redirect_to @ticket
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def valid_ticket
    user = User.find_by(person_id: current_person.id)
    @ticket = Ticket.find(params[:id])

    validar = TicketsPolicies.new(user, @ticket)
    if validar.own_ticket?
      render :show
    else
      redirect_to user_path(user.id)
    end
  end

  def set_line_user
    User.find_by(person_id: current_person.id)
  end

  def set_params
    params.require(:ticket).permit(:title, :description, :recipient,
                                   :user_id, :attach)
  end
end
