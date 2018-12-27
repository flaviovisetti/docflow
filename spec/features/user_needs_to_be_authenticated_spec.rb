# frozen_string_literal: true

require 'rails_helper'

feature 'user needs to be authenticated' do
  scenario 'not access user view' do
    person = create(:person)
    user = create(:user, person: person)

    visit user_path(user.id)

    expect(current_path).to eq(new_person_session_path)
  end
  scenario 'not access company view' do
    person = create(:person)
    create(:user, person: person)

    visit new_company_path

    expect(current_path).to eq(new_person_session_path)
  end
  scenario 'not access ticket history view' do
    person = create(:person)
    user = create(:user, person: person)
    ticket = create(:ticket, user: user)

    visit new_ticket_history_path(ticket)

    expect(current_path).to eq(new_person_session_path)
  end
  scenario 'not access ticket view' do
    person = create(:person)
    create(:user, person: person)

    visit new_ticket_path

    expect(current_path).to eq(new_person_session_path)
  end
end
