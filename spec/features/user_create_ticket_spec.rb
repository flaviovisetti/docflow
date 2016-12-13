require 'rails_helper'

feature 'user create ticket' do
  scenario 'user create ticket succesfully' do
    person = create(:person)
    user = create(:user, person: person)
    ticket = build(:ticket, user: user)

    login_as(person)

    visit user_path(user.id)

    click_on 'Registrar Ticket'
    select ticket.user.name, from: 'Usuário'
    fill_in 'Título', with: ticket.title
    fill_in 'Descrição', with: ticket.description
    fill_in 'Destinatário', with: ticket.recipient
    attach_file('Anexo', 'spec/support/fixtures/image.jpg')

    click_on 'Registrar'

    expect(page).to have_content(ticket.title)
    expect(page).to have_content(ticket.description)
    expect(page).to have_content(ticket.recipient)
    expect(page).to have_content(ticket.user.name)
    expect(page).to have_content('Em Aberto')
    expect(page).to have_content(ticket.attach_file_name)
  end
  scenario 'and try submit as empty' do
    person = create(:person)
    user = create(:user, person: person)

    login_as(person)

    visit user_path(user.id)

    click_on 'Registrar Ticket'

    within('form') do
      click_on 'Registrar'
    end

    expect(page).to have_content('Não é possível registrar o ticket')
  end
end
