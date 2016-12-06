require 'rails_helper'

feature 'user sign in' do
  scenario 'user visit login view' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_person_session_path)
    expect(page).to have_content('Email')
    expect(page).to have_content('Senha')
  end
end
