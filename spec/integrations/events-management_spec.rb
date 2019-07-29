require 'rails_helper'
 
RSpec.describe 'Event Creation', type: :feature do
    scenario 'Checking the attendee' do
    login
    add_user
    visit home_path
    expect(page).to have_button('Create')
    fill_in 'Event title', with: "Some Event"
    fill_in 'Date', with: Time.now
    check 'attendees_'
    click_button 'Create'
    expect(page).to have_content('Grace')
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

  def add_user
    user = User.create(name:"Grace")
  end
end