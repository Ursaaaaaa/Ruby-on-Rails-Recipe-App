require 'rails_helper'

RSpec.describe User, type: :model do
  subject { Recipe.new(name: 'Frank', cooking_time: 5, preparation_time: 10, description: 'boil') }
  before { subject.save }

  it 'Name should not be empty or nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
