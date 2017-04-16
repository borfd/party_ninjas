require "rails_helper"

RSpec.feature "events" do
  let(:photo) { File.join(Rails.root, "spec", "fixtures", "fusion.png") }
	let!(:user) { User.create!(name: "boris", email: "something@example.com", password: "something", avatar: photo) }
	let!(:event) { Event.create(title: "Something", place: "somewhere", date: Date.today, user:user) }
	let!(:second_event) { Event.create(title: "kater", place: "kater", date: Date.tomorrow, user:user) }
	let!(:third_event) { Event.create(title: "in 20 days", place: "keller", date: 20.days.from_now, user:user) }
  let(:photo) { Rack::Test::UploadedFile.new(File.join(Rails.root, "app", "assets", "images", "fusion.png")) }

	before { login }

	def login
		visit root_url
		within ".user-actions" do
			click_link "Login"
		end
		fill_in "Email", with: "something@example.com"
		fill_in "Password", with: "something"
		click_button "Log in"
	end

	scenario "I want to be able to add a new event" do
		visit new_event_path
		expect(page).to have_content("Add Event")
		fill_in "Title", with: "test event"
		fill_in "Date", with: "2017/06/06"
		fill_in "Place", with: "Kater Blau"
		fill_in "Description", with: "Sick party"

		# attach_file "Header Image", photo
		click_button "Create Event"
		expect(page).to have_content("Your event has been added")
		expect(page).to have_content("Kater Blau")
		click_link "Edit"
		fill_in "Description", with: "inadiclub"
		click_button "Update Event"
		expect(page).to have_content("inadiclub")
		within ".attendees" do
			expect(page).to have_content(user.name)
		end
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
		expect(page).to have_content("kater")
		expect(page).to have_content(Date.today.strftime("%a, %B %d %Y"))
		expect(page).to have_content(user.name)
		# click_link "kater"
		expect(page).to have_content("kater")
	end


	scenario 'I want to see my name in events that I am attending' do
	  visit event_path(second_event.id)
	  expect(page).to have_content("Attending")
	  click_link "Attend"
	  expect(page).to have_content(user.name)
	end

	scenario "I want to see todays events" do
		visit events_path
		click_link "Today"
		expect(page).to have_content("Something")
		expect(page).to_not have_content("Kater")
	end

	scenario "I want to see this weeks events" do
		visit events_path
		click_link "This Week"
		expect(page).to have_content("Something")
		expect(page).to have_content("kater")
		expect(page).to_not have_content("keller")
	end

end
