require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  let(:photo) { Rack::Test::UploadedFile.new(File.join(Rails.root, "app", "assets", "images", "fusion.png")) }
  let!(:iva) { User.create!(name: "boris", email: "something@example.com", password: "something", avatar: photo) }
  let!(:boris) { User.create!(name: "iva", email: "something2@example.com", password: "something", avatar: photo) }
  let(:user) { iva }
  let(:event) { klubnacht }

  let!(:klubnacht) { Event.create(title: "Something", place: "somewhere", date: Date.today, user:user) }
  let!(:sisy_opening) { Event.create(title: "Something else", place: "somewhere else", date: Date.today, user:user) }

  it "user can attend multiple events" do
    iva.attend(klubnacht)
    iva.attend(sisy_opening)
    boris.attend(klubnacht)

    expect(iva.events).to include(klubnacht)
    expect(iva.events).to include(sisy_opening)

    expect(klubnacht.users).to include(iva)
    expect(klubnacht.users).to include(boris)
  end


end
