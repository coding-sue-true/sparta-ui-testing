require 'spec_helper'

describe 'Incorrect user details produces successful failure' do

  after(:all) do
    Capybara.current_session.driver.quit
  end

  context 'it produce an error if one or more fields are not filled' do

    it 'should introduce correctly the DOB fields' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.dob_day_field('12')
      @bbc_site.bbc_sign_up_page.dob_month_field('11')
      @bbc_site.bbc_sign_up_page.dob_year_field('1993')
      @bbc_site.bbc_sign_up_page.click_continue_button
      sleep 5
    end

    it "should fail when password field does not match the requirements" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_up_page.fill_in_email('coding@icloud.com')
      @bbc_site.bbc_sign_in_page.fill_in_password('test')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_up_page.password_error_message).to eq('Sorry, that password is too short. It needs to be eight characters or more.')
      sleep 5
    end
  end
end
