class HistoriesController < ApplicationController
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @history = History.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])

    @history = History.new(set_params)
    @history[:ticket_id] = @ticket.id
    @history.save
    @ticket.update(status: 'Aprovado')

    redirect_to user_path(set_current_user)
  end

  private

  def set_params
    params.require(:history).permit(:comment)
  end

  def set_current_user
    User.where(person_id: current_person.id).first
  end
end
