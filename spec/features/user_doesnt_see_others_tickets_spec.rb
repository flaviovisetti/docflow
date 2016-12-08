require 'rails_helper'

feature 'user does note see others tickets' do
  scenario 'and not see tickets which his not envolves' do
    person = create(:person)
    person_two = create(:person, email: 'galvaozinho@neymarfan.com.br')
    user_one = create(:user, name: 'Teo Jose', person: person)
    user_two = create(:user, name: 'Galvao Bueno', person: person_two)
    ticket = create(:ticket, user: user_two)

    login_as(person)

    visit ticket_path(ticket.id)

    expect(current_path).to eq(user_path(user_one.id))
  end
end
