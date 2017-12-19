require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    it 'should produce an error when inputting an incorrect password to a valid account' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username('coding_sue')
      @bbc_site.bbc_sign_in_page.fill_in_password('1234abcde')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eq("Sorry, we can’t find an account with that username. If you\'re over 13, try your email address instead or get help here.")

      sleep 5
    end

  end

end
