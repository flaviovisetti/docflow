require 'rails_helper'

feature 'user create a company' do
  scenario 'successfully to create' do
    company = build(:company)

    visit root_path
    click_on 'Cadastrar Empresa'

    fill_in 'Razão Social', with: company.legal_name
    fill_in 'Email', with: company.mail
    fill_in 'Registro Legal', with: company.legal_number

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_css('strong', text: company.legal_name)
    expect(page).to have_content(company.mail)
    expect(page).to have_content(company.legal_number)
  end
end
