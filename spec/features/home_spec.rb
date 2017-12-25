# frozen_string_literal: true

require 'rails_helper'


RSpec.feature 'landing page' do
  let(:photo_path) {File.join(Rails.root, 'spec', 'fixtures', 'fusion.png')}

  def sign_up
    visit root_url
    within '.user-actions' do
      click_link 'Login'
    end
    click_link 'Sign up'
    fill_in 'Name', with: 'boris'
    fill_in 'Email', with: 'boris@partyniggaz.com'
    fill_in 'Password', with: 'i l1k3 p3!'
    fill_in 'Password confirmation', with: 'i l1k3 p3!'
    page.attach_file 'Avatar', photo_path
    click_button 'Sign up'
  end

  scenario 'I expect to see Party Niggaz' do
    visit root_url
    expect(page).to have_title('Party Niggaz')
  end

  scenario 'i want to register with name' do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'i want to be able to log out' do
    sign_up
    expect(page).to have_link('Logout')
    within '.top-bar-left' do
      click_link 'Logout'
    end
    expect(page).to have_content('Log in')
  end
end
