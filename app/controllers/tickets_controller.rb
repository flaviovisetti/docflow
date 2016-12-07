class TicketsController < ApplicationController
  def new
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

  def set_params
    params.require(:ticket).permit(:title, :description, :recipient, :user_id)
  end
end
