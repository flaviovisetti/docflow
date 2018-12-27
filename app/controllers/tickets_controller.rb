# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_person!
  before_action :set_current_user

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @current_user.tickets.new(set_params)
    if @ticket.save
      redirect_to @ticket
    else
      flash.now[:alert] = 'Não é possível registrar o ticket'
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    policy = TicketsPolicies.new(@current_user, @ticket)
    if policy.own_ticket?(current_person.email)
      render :show
    else
      redirect_to user_path(@current_user)
    end
  end

  private

  def set_current_user
    @current_user = User.where(person_id: current_person.id).first
  end

  def set_params
    params.require(:ticket).permit(:title, :description, :recipient,
                                   :attach)
  end
end
