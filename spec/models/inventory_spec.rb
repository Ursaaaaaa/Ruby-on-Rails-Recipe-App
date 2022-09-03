require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { Inventory.new(name: 'Sauce Booking') }
  before { subject.save }

  it 'Name should not be empty or nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
