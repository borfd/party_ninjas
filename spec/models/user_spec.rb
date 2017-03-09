require 'spec_helper'

RSpec.describe User do
  subject { User.create(email: "boris@gmail.com", password: 'yeahbro') }
  let(:event) { Event.create!(place: 'Sisy', date: Date.today, user: subject, title: "opening") }
  it "has can_attend? method" do
    expect(subject.can_attend?(event)).to be true
    subject.attend(event)
    expect(subject.can_attend?(event)).to be false
  end
end
