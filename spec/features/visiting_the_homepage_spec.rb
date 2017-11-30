require 'rails_helper'

feature 'visiting the homepage'  do
  before(:all) do
    Rails.application.load_seed
  end

  scenario 'the user sees a list of available recipes' do
    visit '/'
    click_link 'login'
    fill_in 'email', with: 'mom@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    click_link 'home'
    expect(page).to have_content "Recipe List"
  end
end
