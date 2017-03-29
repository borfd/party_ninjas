require 'rails_helper'

RSpec.describe "admin feature" do
  let(:photo) { Rack::Test::UploadedFile.new(File.join(Rails.root, "app", "assets", "images", "fusion.png")) }
  let!(:admin) { User.create!(name: "boris", email: "something@example.com", password: "something", avatar: photo, admin: true) }
  let!(:user) { User.create!(name: "louis", email: "something2@example.com", password: "something", avatar: photo) }

  def login(user)
    visit root_url
    within ".user-actions" do
      click_link "Login"
    end
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "as an admin I want to be able to deleted users" do
    login(admin)
    visit root_url
    within "#user-#{user.id}" do
      click_link "destroy"
    end
    expect(page).to_not have_css("#user-#{user.id}")
    expect(current_path).to eq(root_path)
  end

  scenario "as a normal user, I don't want to be able to delete users" do
    login(user)
    visit root_url
    expect(page).to_not have_content("destroy")
  end
end


