require 'rails_helper'

feature 'user create a company' do
  scenario 'successfully to create' do
    person = create(:person)
    user = create(:user, person: person)
    company = build(:company)

    login_as(person)

    visit user_path(user.id)
    click_on 'Cadastrar Empresa'

    fill_in 'Razão Social', with: company.legal_name
    fill_in 'Email', with: company.mail
    fill_in 'Registro Legal', with: company.legal_number

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_css('h3', text: company.legal_name)
    expect(page).to have_content(company.mail)
    expect(page).to have_content(company.legal_number)
  end
  scenario 'and does not allow create with blank fields' do
    person = create(:person)
    user = create(:user, person: person)

    login_as(person)

    visit user_path(user.id)
    click_on 'Cadastrar Empresa'

    click_on 'Cadastrar'

    expect(page).to have_content('Não é possível cadastrar empresa.')
  end
end
