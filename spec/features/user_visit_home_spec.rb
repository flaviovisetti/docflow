require 'rails_helper'

feature 'user visit home page' do
  scenario 'succesfully to visit' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome aboard')
  end

  scenario 'succesfully read product presentation' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome aboard')
    expect(page).to have_content('Bem-vindo! As interações entre seu
      time acabaram de ficar mais fáceis e ágeis,
      através de uma interface intuitiva e com vários recursos.')
  end

  scenario 'and if user does log in' do
    person = create(:person)
    create(:user, person: person)

    login_as(person)

    visit root_path

    expect(page).to have_content('Painel do usuário')
  end
end
