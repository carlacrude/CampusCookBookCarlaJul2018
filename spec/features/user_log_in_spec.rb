require 'rails_helper'

feature 'User login' do

  scenario 'successfully' do
    user = create(:user)

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Ola #{user.email}")  
  end

end