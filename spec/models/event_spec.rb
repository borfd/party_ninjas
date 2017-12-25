# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  let(:user) { User.create(email: 'something', password: 'something') }
  let(:label) { Label.create(name: 'sailing') }

  subject do
    described_class.new(
      title: 'test',
      date: '01.01.17',
      place: 'Kater',
      user: user,
      date: Date.yesterday
    )
  end

  it 'is not valid without all attributes' do
    expect(Event.new(user: user)).to_not be_valid
  end

  it 'is valid with all attributes' do
    expect(subject).to be_valid
  end

  it 'has expired? method' do
    expect(subject).to be_expired
    subject.date = Date.tomorrow
    expect(subject).to_not be_expired
  end

  it 'has header image' do
    subject.header_image = File.open(File.absolute_path(File.join(Rails.root, 'app', 'assets', 'images', 'fusion.png')))
    expect { subject.save }.to_not raise_error
  end

  it 'has labels' do
    expect(subject.labels).to_not include label
    subject.labels << label
    expect(subject.labels).to include label
  end
end
