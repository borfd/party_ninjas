require "rails_helper"

RSpec.feature "landing page" do
	scenario "I expect to see Party Niggaz" do
		visit root_url
		expect(page).to have_title("Party Niggaz")
	end

  scenario "i want to register with name" do
    visit root_url
    within ".user-actions" do
        click_link "Login"
    end
    click_link "Sign up"
    fill_in "Name", with: "boris"
    fill_in "Email", with: "boris@partyniggaz.com"
    fill_in "Password", with: "i l1k3 p3!"
    fill_in "Password confirmation", with: "i l1k3 p3!"
    click_button "Sign up"
  end
end
