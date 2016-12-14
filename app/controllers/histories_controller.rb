class HistoriesController < ApplicationController
  before_action :authenticate_person!
  before_action :set_current_user

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @history = History.new
    @current_user = set_current_user
  end

  def create
    ticket = Ticket.find(params[:ticket_id])
    ticket.histories.create(history_params)

    if params[:commit] == 'Aprovar'
      ticket.approved!
    else
      ticket.reproved!
    end

    redirect_to user_path(set_current_user)
  end

  private

  def history_params
    params.require(:history).permit(:comment)
  end

  def set_current_user
    User.where(person_id: current_person.id).first
  end
end
