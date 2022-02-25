require 'rails_helper'

RSpec.describe 'User Validation', type: :system do
  describe 'LogIn page' do
    it 'shows the right content' do
      visit new_user_session_path
      sleep(1)
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_selector(:link_or_button, 'Log in')
    end
    it 'should raise an error if the inputs are empty' do
      visit new_user_session_path
      sleep(1)
      click_button('Log in')
      sleep(1)
      expect(page).to have_field('Email', with: '')
      expect(page).to have_field('Password', with: '')
      expect(page.find('.alert')).to have_content('You need to sign in or sign up before continuing')
    end
    it 'should raise an error if the data is invalid' do
      visit new_user_session_path
      sleep(1)
      page.fill_in 'Email', with: 'josh@gmail.com'
      sleep(1)
      page.fill_in 'Password', with: '12'
      sleep(1)
      expect(page).to have_field('Email', with: 'josh@gmail.com')
      expect(page).to have_field('Password', with: '12')
      click_button('Log in')
      sleep(3)
      expect(page.find('.alert')).to have_content('Invalid Email or password.')
    end
    it 'should redirect to the root page if the data is correct' do
      visit new_user_session_path
      User.create(name: 'mat', email: 'mat@gmail.com', password: '123456')
      sleep(1)
      page.fill_in 'Email', with: 'mat@gmail.com'
      sleep(1)
      page.fill_in 'Password', with: '123456'
      sleep(1)
      expect(page).to have_field('Email', with: 'mat@gmail.com')
      expect(page).to have_field('Password', with: '123456')
      click_button('Log in')
      sleep(2)
      expect(page).to have_current_path(foods_path)
      sleep(2)
    end
  end
end
