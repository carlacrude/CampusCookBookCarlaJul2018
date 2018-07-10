require 'rails_helper'

feature 'User login' do

  scenario 'successfully' do
    user = User.create(email: 'testeimersao@gmail.com', password: 'teste12345')

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{user.email}")  
  end

  scenario 'does not see Entrar link' do
    user = User.create(email: 'testeimersao@gmail.com', password: 'teste12345')

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(current_path).to eq(root_path)
    expect(page).not_to have_content("Entrar")  
  end
  
end