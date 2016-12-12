require 'rails_helper'

feature 'user return panel from ticket' do
  scenario 'user returns to panel before visualize
            ticket wich he is recipient' do
    person = create(:person)
    user = create(:user, person: person)

    person_other = create(:person, email: 'flavio@docflux.com',
                                   password: 'docflux1234')
    user_other = create(:user, name: 'Flavio Visetti', person: person_other)

    ticket_one = create(:ticket, title: 'Ticket teste',
                                 recipient: 'odair@teste.com.br',
                                 user: user_other)
    create(:ticket, title: 'Outro ticket',
                    recipient: 'odair@teste.com.br',
                    user: user_other)

    login_as(person)

    visit user_path(user.id)

    click_on ticket_one.title

    click_on 'Voltar'

    expect(page).to have_content(user.name)
  end
end
