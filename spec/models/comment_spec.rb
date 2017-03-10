require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is not valid" do
    expect(subject).to_not be_valid
  end
end
