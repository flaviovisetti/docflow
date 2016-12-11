require 'rails_helper'

feature 'user view ticket' do
  scenario 'and view your own tickets' do
    person = create(:person)
    user = create(:user, person: person)
    ticket = create(:ticket, user: user)

    login_as(person)

    visit user_path(user.id)

    expect(page).to have_content(ticket.id)
    expect(page).to have_content(ticket.title)
    expect(page).to have_content(ticket.recipient)
    expect(page).to have_content(ticket.status)
  end
end
