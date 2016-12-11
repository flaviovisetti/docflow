require 'rails_helper'

feature 'user visit panel' do
  scenario 'user access his panel' do
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

  scenario 'and direct to registration after signed up' do
    person = build(:person)

    visit new_person_registration_path

    fill_in 'Email', with: person.email
    fill_in 'person[password]', with: person.password
    fill_in 'person[password_confirmation]', with: person.password

    within('form') do
      click_on 'Sign up'
    end

    expect(current_path).to eq(new_user_path)
  end

  scenario 'and direct to his panel after signed in' do
    person = create(:person)
    user = create(:user, person: person)

    visit new_person_session_path

    fill_in 'Email', with: person.email
    fill_in 'Senha', with: person.password
    click_on 'Entrar'

    expect(current_path).to eq(user_path(user.id))
  end
end
