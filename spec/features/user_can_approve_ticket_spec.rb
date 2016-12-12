require 'rails_helper'

feature 'user can approve tickets' do
  scenario 'user has recipient ticket and view approves' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket_one = create(:ticket, title: 'Ticket teste',
                                 recipient: 'odair@teste.com.br',
                                 user: user_other)


    login_as(person)

    visit user_path(user.id)

    expect(page).to have_content('Aprovar')
    expect(page).to have_content('Reprovar')
  end

  scenario 'user approves ticket' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket_one = create(:ticket, title: 'Ticket teste',
                                 recipient: 'odair@teste.com.br',
                                 user: user_other)
    ticket_history = build(:ticket_history, ticket: ticket_one)


    login_as(person)

    visit user_path(user.id)

    click_on 'Aprovar'

    fill_in 'Comentário', with: ticket_history.comment
    within('form') do
      click_on 'Registrar'
    end

    expect(page).to have_content(ticket_history.comment)
    expect(page).to have_content(ticket_history.modifier)
  end
end
