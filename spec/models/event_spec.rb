require "spec_helper"

RSpec.describe Event do
	let(:user) { User.create(email: "something", password: "something") }

	it "is not valid without all attributed" do
		expect(Event.new).to_not be_valid
	end

	it "is  valid without all attributed" do
		expect(Event.new(title:"test",date:"01.01.17",place:"Kater",user: user)).to be_valid
	end
end