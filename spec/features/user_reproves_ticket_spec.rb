# frozen_string_literal: true

require 'rails_helper'

feature 'user reproves ticket' do
  scenario 'successfully at reproves' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket_one = create(:ticket, title: 'Ticket teste',
                                 recipient: 'odair@teste.com.br',
                                 user: user_other)
    ticket_history = build(:history, comment: 'Ticket reprovado',
                                     ticket: ticket_one)

    login_as(person)

    visit user_path(user.id)

    click_on 'Avaliar Ticket'

    fill_in 'Comentário', with: ticket_history.comment
    within('form') do
      click_on 'Reprovar'
    end

    expect(page).to have_content(user.name)
    expect(page).to have_content('Reprovado')
    expect(page).to have_content('Visualizar Reprovação')
    expect(page).to_not have_content('Avaliar Ticket')
  end
end
