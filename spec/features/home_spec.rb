require "rails_helper"

RSpec.feature "landing page" do
	scenario "I expect to see Party Niggaz" do
		visit root_url
		expect(page).to have_title("Party Niggaz")
	end
end
