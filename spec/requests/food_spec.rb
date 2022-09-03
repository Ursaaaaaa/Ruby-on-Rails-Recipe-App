require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods' do
    include Devise::Test::IntegrationHelpers
    before(:each) do
      @user = User.create(name: 'Rickon', email: 'rickondor22@gmail.com', password: 'password')
      @food = Food.create(name: 'Bread', measurement_unit: 'grams', price: 6, user_id: @user.id)

      sign_in @user
      get foods_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template('foods/index')
    end

    it 'displays the food name' do
      expect(response.body).to include(@food.name)
    end

    it 'displays the food price' do
      expect(response.body).to include(@food.price.to_s)
    end

    it 'should have user_id' do
      expect(@food.user_id).to eq(@user.id)
    end
  end
end
