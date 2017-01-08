require "rails_helper"

RSpec.feature "landing page" do
	scenario "I expect to see Party Niggaz" do
		visit root_url
		expect(page).to have_content("Party Niggaz")
	end
end