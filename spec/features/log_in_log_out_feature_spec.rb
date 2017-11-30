require 'rails_helper'

feature 'registering for a new account' do
  scenario 'user sign up' do
    visit '/'
    click_link('signup')
    fill_in 'user[username]', with: 'Kathiee'
    fill_in 'user[email]', with: 'Kathiee'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content "Kathiee's Recipes"
  end
end

feature 'logging in' do
  scenario 'user can login' do
    User.create(username: "mom", email: "mom@email.com", password: "password")
    visit '/'
    click_link('login')
    fill_in 'email', with: 'mom@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "mom's Recipes"
  end
end

feature 'logging out' do
  scenario 'user can logout' do
    User.create(username: "mom", email: "mom@email.com", password: "password")
    visit '/'
    click_link('login')
    fill_in 'email', with: 'mom@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content "mom's Recipes"
    click_link('logout')
    expect(page).to have_content "login"
  end
end

