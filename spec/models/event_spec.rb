require "spec_helper"

RSpec.describe Event do
	let(:user) { User.create(email: "something", password: "something") }

  subject {
    described_class.new(
      title:"test",
      date:"01.01.17",
      place:"Kater",
      user: user,
      date: Date.yesterday)
  }

	it "is not valid without all attributes" do
		expect(Event.new(user: user)).to_not be_valid
	end

	it "is valid with all attributes" do
		expect(subject).to be_valid
	end

  it "has expired? method" do
    expect(subject).to be_expired
    subject.date = Date.tomorrow
    expect(subject).to_not be_expired
  end
end
