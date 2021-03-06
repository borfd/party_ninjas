require 'spec_helper'

RSpec.describe EventCalendarService do
  let(:photo) { Rack::Test::UploadedFile.new(File.join(Rails.root, "app", "assets", "images", "fusion.png")) }
  let!(:user) { User.create!(name: "boris", email: "something@example.com", password: "something", avatar: photo) }
  let!(:event) { Event.create(title: "Something", place: "somewhere", date: Date.today, user:user) }
  let!(:second_event) { Event.create(title: "kater", place: "somewhere else", date: Date.tomorrow, user:user) }
  let!(:event_in_the_past) { Event.create(title: "kater", place: "somewhere else", date: Date.yesterday, user:user) }
  let(:today) { Date.today }

  it "returns event for today" do
    expect(subject.today).to eq([event])
  end

  it "returns event for given date" do
    expect(subject.on_day(today).to_a).to eq([event])
  end

  it "can chain from/to" do
    expect(subject.from(today).to(today).to_a).to eq([event])
  end

  it "has #upcoming which doesnt return events in the past" do
    expect(subject.upcoming).to_not include(event_in_the_past)
    expect(subject.upcoming).to include(event, second_event)
  end

end

