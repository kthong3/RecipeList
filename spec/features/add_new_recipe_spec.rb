require 'rails_helper'

feature 'adding a new recipe'  do
  before(:all) do
    Rails.application.load_seed
  end

  scenario 'the user can add a new recipe' do
    visit '/'
    click_link 'login'
    fill_in 'email', with: 'mom@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    click_button 'Add New Recipe'

    within('.new_recipe') do
      fill_in 'recipe[title]', with: 'chicken noodle soup'
      fill_in 'recipe[cook_time]', with: '30 minutes'
      fill_in 'recipe[ingredients]', with: 'chicken'
      fill_in 'recipe[instructions]', with: 'boil it'
      click_button 'Save'
    end

    expect(page).to have_content "chicken noodle soup"
  end
end
