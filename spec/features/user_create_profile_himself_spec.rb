require 'rails_helper'

feature 'user create profile himself' do
  scenario 'create the profile succesfully' do
    person = create(:person)
    single_user = build(:user)

    login_as(person)

    visit root_path
    click_on 'Cadastrar Usuário'

    fill_in 'Nome Completo', with: single_user.name
    fill_in 'Telefone', with: single_user.phone
    fill_in 'Data Nascimento', with: single_user.birthdate

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_css('strong', text: single_user.name)
    expect(page).to have_content(single_user.phone)
    expect(page).to have_content(single_user.birthdate)
  end
  scenario 'try save empty profile' do
    person = create(:person)

    login_as(person)

    visit root_path

    click_on 'Cadastrar Usuário'

    click_on 'Cadastrar'

    expect(page).to have_content('Não possível criar usuário')
  end
end
