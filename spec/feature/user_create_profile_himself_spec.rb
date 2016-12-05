require 'rails_helper'

feature 'user create profile himself' do
  scenario 'create the profile succesfully' do
    single_user = build(:user)

    visit root_path
    click_on 'Cadastrar Usuário'

    fill_in 'Nome Completo', with: single_user.name
    fill_in 'E-mail', with: single_user.mail
    fill_in 'Data Nascimento', with: single_user.birthdate

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_css('strong', text: single_user.name)
    expect(page).to have_content(single_user.mail)
    expect(page).to have_content(single_user.birthdate)
  end
end
