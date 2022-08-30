require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user = User.create! name:'frank', password: '123456', email: 'user@email.com'
      @recipe = Recipe.create! user_id: @user.id, name: 'New recipe name', preparation_time: 20, cooking_time: 40,
                               description: 'Recipe description', public: true
      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

   
    scenario 'USers can view their own recipes and see delete button' do
      visit '/recipes'
      expect(page).to have_content('New recipe name')
      expect(page).to have_content('Remove')
    end

    scenario 'USers can delete their recipes' do
      visit '/recipes'
      expect(page).to have_content('New recipe name')
      click_button 'Remove'
      expect(page).to have_no_content('New recipe name')
    end


    scenario 'Users can create a new recipe' do
      visit '/recipes/new'
      expect(page).to have_content('Add new recipe')
      fill_in 'Name', with: 'New recipe'
      fill_in 'Description', with: 'Description'
      click_button 'Add Recipe'

      expect(page).to have_content('Recipe')
    end
  end
end