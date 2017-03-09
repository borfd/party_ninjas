require 'spec_helper'

RSpec.describe User do
  subject { User.create(email: "boris@gmail.com", password: 'yeahbro') }
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
end
