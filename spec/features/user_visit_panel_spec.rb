require 'rails_helper'

feature 'user visit panel' do
  scenario 'user acess his panel' do
    person = create(:person)
    user = create(:user, person: person)
    create(:ticket, user: user)

    login_as(person)

    visit user_path(user.id)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.tickets.first.title)
    expect(page).to have_content(user.tickets.first.recipient)
    expect(page).to have_content(user.tickets.first.status)
    expect(page).to have_content('Registrar Ticket')
    expect(page).to have_content('Logout')
  end
end
