class HistoriesController < ApplicationController
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @history = History.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])

    @history = History.new(set_params)
    @history.save
    @ticket.update(status: 'Aprovado')

    redirect_to user_path(set_ticket_user)
  end

  private

  def set_params
    params.require(:history).permit(:comment)
  end

  def set_ticket_user
    tck = Ticket.find(params[:ticket_id])
    User.where(person_id: tck.id).first
  end
end
