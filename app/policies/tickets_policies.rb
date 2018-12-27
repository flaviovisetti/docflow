# frozen_string_literal: true

class TicketsPolicies
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def own_ticket?(email)
    (user.id == ticket.user_id) || (ticket.recipient == email)
  end
end
