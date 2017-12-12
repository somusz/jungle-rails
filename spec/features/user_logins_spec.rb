require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = User.create! first_name: 'Ace', last_name: 'Ventura', email: 'ace@ventura.com', password: '12345', password_confirmation: '12345'
  end

  scenario "they can login" do
    visit root_path

    visit new_session_path

    fill_in 'Email', with: @user.email

    fill_in 'Password', with: @user.password

    find('.btn-primary').click

    visit root_path

    expect(page).to have_link 'Sign out'

  end
end
