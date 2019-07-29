require 'rails_helper'
 
RSpec.describe 'Home', type: :feature do
    scenario 'Home Page' do
    visit home_path
    expect(page).to have_content('Log In')
  end

  scenario 'Home Page When Logged In' do
    login
    visit home_path
    expect(page).to have_content('Log out')
    expect(page).not_to have_content('Log in')
  end
  
  scenario 'Home Page When Logged Out' do
    login
    visit home_path
    expect(page).to have_content('Log out')
    logout
    expect(page).to have_content('Log In')
  end

  def login
    user = User.create(name:"Emre")
    visit login_path
    fill_in 'Name', with: user.name
    click_button 'Log in'
  end

  def logout
    click_link 'Log out'
  end
end