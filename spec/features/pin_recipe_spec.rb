require 'rails_helper'

feature 'pinning and unpinning a recipe'  do
  before(:all) do
    Rails.application.load_seed
  end

  scenario 'the user can save a recipe to their profile' do
    visit '/'
    click_link 'login'
    fill_in 'email', with: 'grandma@email.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    click_link 'home'

    click_link 'Spinning Fried Chicken'
    click_button 'Save this Recipe'

    expect(page).to have_content "Spinning Fried Chicken"
  end

  scenario 'the user can save a recipe to their profile' do
     PinnedRecipe.create(user: User.first, recipe: Recipe.last)
     visit '/'
     click_link 'login'
     fill_in 'email', with: 'mom@email.com'
     fill_in 'password', with: 'password'
     click_button 'Login'
     click_link 'home'
     click_link 'Spinning Fried Chicken'

     click_button 'Unpin'
     expect(page).not_to have_content "Spinning Fried Chicken"
  end

end
