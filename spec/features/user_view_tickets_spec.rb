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
  scenario 'and view ticket which does are recipient' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket = create(:ticket, title: 'Ticket teste',
                             recipient: 'odair@teste.com.br',
                             user: user_other)

    login_as(person)

    visit user_path(user.id)

    expect(page).to have_content(ticket.title)
    expect(page).to have_content(user_other.name)
  end
  scenario 'and view more than one ticket which does are recipient' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket_one = create(:ticket, title: 'Ticket teste',
                                 recipient: 'odair@teste.com.br',
                                 user: user_other)
    ticket_two = create(:ticket, title: 'Outro ticket',
                                 recipient: 'odair@teste.com.br',
                                 user: user_other)

    login_as(person)

    visit user_path(user.id)

    expect(page).to have_content(ticket_one.title)
    expect(page).to have_content(ticket_two.title)
  end
  scenario 'View comment after approved' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket_one = create(:ticket, title: 'Ticket teste',
                                 recipient: 'odair@teste.com.br',
                                 status: 'Aprovado',
                                 user: user_other)
    ticket_history = create(:history, ticket: ticket_one)

    login_as(person)

    visit user_path(user.id)

    click_on ticket_one.title

    expect(page).to have_content(ticket_history.comment)
  end
end
