require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  let!(:iva) { User.create!(email: "something@example.com", password: "something") }
  let!(:boris) { User.create!(email: "something2@example.com", password: "something") }
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
