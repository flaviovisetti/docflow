require 'rails_helper'

feature 'user visit new user after signup spec' do
  scenario 'create user after account signed up' do
    person = create(:person)
    user = build(:user, person_id: person)

    login_as(person)

    visit new_user_path

    expect(page).to have_content(person.email)
  end
end
