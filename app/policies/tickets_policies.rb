class TicketsPolicies
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def own_ticket?
    user.id == ticket.user_id
  end

end
