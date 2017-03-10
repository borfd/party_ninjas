require 'rails_helper'
RSpec.describe "comments for events" do
  let!(:user) { User.create!(name: "boris", email: "something@example.com", password: "something") }
  let!(:event) { Event.create(title: "Something", place: "somewhere", date: Date.today, user:user) }

  before { login }

  def login
    visit root_url
    click_link "Login"
    fill_in "Email", with: "something@example.com"
    fill_in "Password", with: "something"
    click_button "Log in"
  end

  scenario "i want to add a comment" do
    visit event_path(event)
    fill_in "Comment", with: "Shit's right yo"
    click_button "Add Comment"
    expect(page).to have_content("Shit's right yo")
  end


end
