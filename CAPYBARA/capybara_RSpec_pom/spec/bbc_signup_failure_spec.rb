require 'spec_helper'

describe 'Correct user details produces successful login' do

  context 'it should login successfully when the right details are introduced' do

    it 'should login successfully when username and password are correctly introduced' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link

      @bbc_site.bbc_sign_in_page.fill_in_password('Testing123')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      sleep 5
    end
  end
end
