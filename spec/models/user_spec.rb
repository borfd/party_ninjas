require 'rails_helper'

RSpec.describe User do
  let(:photo) { Rack::Test::UploadedFile.new(File.join(Rails.root, "app", "assets", "images", "fusion.png")) }
  subject { User.create!(name: "boris", email: "boris@gmail.com", password: 'yeahbro', avatar: photo) }
  let(:event) { Event.create!(place: 'Sisy', date: Date.today, user: subject, title: "opening") }

  it "has can_attend? method" do
    expect(subject.can_attend?(event)).to be true
    subject.attend(event)
    expect(subject.can_attend?(event)).to be false
  end

  it "has name" do
    subject.name = "Boris"
    subject.save
    subject.reload
    expect(subject.name).to eq("Boris")
  end

  it "validates presence" do
    subject.name = ""
    expect(subject).to_not be_valid
  end

  it "has admin flag" do
    expect(subject).to_not be_admin
    subject.admin = true
    expect(subject).to be_admin
  end

  it "has can_edit?" do
    expect(subject.can_edit?(event)).to be true
    event.user = User.create!(name: "not boris", email: "notboris@gmail.com", password: "yeahbro", avatar: photo)
    expect(subject.can_edit?(event)).to_not be true
    subject.admin = true
    expect(subject.can_edit?(event)).to be true
  end

end
