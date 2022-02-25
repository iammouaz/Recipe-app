require 'rails_helper'

RSpec.describe 'Public recipe validation', type: :system do
  describe 'Public Recipe List' do
    before do
      visit new_user_session_path
      @user = User.create(name: 'mat', email: 'mat@gmail.com', password: '123456')
      @user2 = User.create(name: 'po', email: 'po@gmail.com', password: '123456')
      @recipe = Recipe.create(name: 'Chocolate Dessert', preparation_time: 1.5, cooking_time: 1.5,
                              description: 'Chocolate', public: true, user_id: @user.id)
      @recipe2 = Recipe.create(name: 'Food Dish', preparation_time: 1.5, cooking_time: 1.5, description: 'Dish',
                               public: false, user_id: @user2.id)
    end
    it 'should render the chocolate dessert with the owner name' do
      page.fill_in 'Email', with: 'mat@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
      visit public_recipes_path
      @li = page.find('.public-recipe-container')
      expect(@li.text).to eq("#{@recipe.name}\nBy #{User.find(@recipe.user_id).name}")
    end
    it 'should render the chocolate dessert with the owner name' do
      page.fill_in 'Email', with: 'po@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
      visit public_recipes_path
      within all('.public-recipe-container')[0] do
        expect(page).to have_content("#{@recipe.name}\nBy #{User.find(@recipe.user_id).name}")
      end
      within all('.public-recipe-container')[1] do
        expect(page).to have_content("#{@recipe2.name}\nBy #{User.find(@recipe2.user_id).name}")
      end
    end
  end
end
