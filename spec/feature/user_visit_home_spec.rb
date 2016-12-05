require 'rails_helper'

feature 'user visit home page' do
  scenario 'succesfully to visit' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome a board')
  end
  scenario 'succesfully read product presentation' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome a board')
    expect(page).to have_content ('Bem-vindo! As interações entre seu
      time acabaram de ficar mais fáceis e ágeis,
      atravez de uma interface intuitiva e com vários recursos.')
  end
end
