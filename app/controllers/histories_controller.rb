class HistoriesController < ApplicationController
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @history = History.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])

    @history = History.new(set_params)
    @history.save

    redirect_to ticket_history_path(@ticket.id)
  end

  private

  def set_params
    params.require(:history).permit(:comment)
  end
end
