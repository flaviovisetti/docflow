require 'rails_helper'

feature 'user create ticket' do
  scenario 'user create ticket succesfully' do
    person = create(:person)
    user = create(:user, person: person)
    ticket = build(:ticket, user: user)

    login_as(person)

    visit root_path

    click_on 'Registrar Ticket'
    select ticket.user.name, from: 'Usuário'
    fill_in 'Título', with: ticket.title
    fill_in 'Descrição', with: ticket.description
    fill_in 'Destinatário', with: ticket.recipient

    click_on 'Registrar'

    expect(page).to have_content(ticket.title)
    expect(page).to have_content(ticket.description)
    expect(page).to have_content(ticket.recipient)
    expect(page).to have_content(ticket.user.name)
    expect(page).to have_content(ticket.status)
  end
end
