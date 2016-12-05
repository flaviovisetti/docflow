require 'rails_helper'

feature 'user visit home page' do
  scenario 'succesfully to visit' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome a board')
  end
end
