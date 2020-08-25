require 'rails_helper'

# RSpec.feature "UserLogins", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end


RSpec.feature "user login", type: :feature, js: true do

  # SETUP
  before :each do
    User.create!({
      name:'Vincent',
      email:'vincent@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    })
  end

  scenario "The user can login" do
    # ACT
    visit root_path

    # DEBUG
    click_link('Login')
    fill_in 'email', with: 'vincent@gmail.com'
    fill_in 'password', with: 'password'
    click_on('Submit')
    
    #VERIFY
    expect(page).to have_text 'Vincent'

  end

end