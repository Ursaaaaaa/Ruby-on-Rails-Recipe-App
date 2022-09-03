require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Frank') }
  before { subject.save }

  it 'Name should not be empty or nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
