require "rails_helper"

RSpec.feature "events" do
	let!(:user) { User.create!(email: "something@example.com", password: "something") }
	let!(:event) { Event.create(title: "Something", place: "somewhere", date: Date.today, user:user) }
	let!(:second_event) { Event.create(title: "Something else", place: "somewhere else", date: Date.today, user:user) }

	scenario "I want to be able to add a new event" do
		visit new_event_url
		expect(page).to have_content("Add a new event")
		fill_in "Title", with: "test event"
		select "2017", from: "Year"
		select "March", from: "Month"
		select "1", from: "Day"
		fill_in "Place", with: "Kater Blau"
		fill_in "Description", with: "Sick party"
		click_button "Create Event"
		expect(page).to have_content("Your event has been added")
		expect(page).to have_content("Kater Blau")
	end

	scenario "I want to see all event attributes" do		
		visit event_url(event)
		expect(page).to have_content("Something")
		expect(page).to have_content("somewhere")
		expect(page).to have_content(Date.today)
		expect(page).to_not have_content("Your event has been added")
	end

	scenario "I want to see a list of all events" do
		visit events_path
		expect(page).to have_content("Something")
		expect(page).to have_content("Something else")
		click_link "Something"
		expect(page).to have_content("somewhere")
	end	
end