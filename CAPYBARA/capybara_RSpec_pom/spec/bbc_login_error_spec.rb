require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  after(:all) do
    Capybara.current_session.driver.quit
  end

  context 'it should respond with the correct error when incorrect details are input' do

    it 'should produce an error when inputting an incorrect username and a valid password' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username('coding_sue')
      @bbc_site.bbc_sign_in_page.fill_in_password('Testing123')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_username_text).to eq("Sorry, we can’t find an account with that username. If you\'re over 13, try your email address instead or get help here.")
    end

    it 'should produce an error when inputting a correct username and an invalid password' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username('coding_sue@icloud.com')
      @bbc_site.bbc_sign_in_page.fill_in_password('test')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eq("Sorry, that password is too short. It needs to be six characters or more.")
    end

    

  end
end
