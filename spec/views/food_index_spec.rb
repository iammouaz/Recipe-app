require 'rails_helper'

RSpec.describe 'Food index validation', type: :system do
  describe 'Food index' do
    before do
      visit new_user_session_path
      @user = User.create(name: 'mat', email: 'mat@gmail.com', password: '123456')
      @food = Food.create(name: 'Orange', measurement_unit: 'kg', price: 7, user_id: @user.id)
      page.fill_in 'Email', with: 'mat@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button('Log in')
    end
    it 'should render the name of the food in one of the columns of the table' do
      expect(page.find('.t-name')).to have_content(@food.name)
    end
    it 'should render the measurement unit of the food in one of the columns of the table' do
      expect(page.find('.t-measurement_unit')).to have_content(@food.measurement_unit)
    end
    it 'should render the price of the food in one of the columns of the table' do
      expect(page.find('.t-price')).to have_content("$ #{@food.price}")
    end
    it 'should render the delete btn in one of the columns of the table' do
      dlt_btn = find('.delete-btn')
      expect(page).to have_button(dlt_btn.text)
    end
  end
end
