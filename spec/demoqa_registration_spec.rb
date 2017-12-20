require 'spec_helper'
require_relative '../selenium_demoqa_registration.rb'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eql 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      expect(@driver.first_name_field_displayed).to be(true)
    end

    it 'should accept a last name' do
      expect(@driver.last_name_field_displayed).to be(true)
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      expect(@driver.select_marital_option).to be(true)
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      expect(@driver.select_hobby_option).to be(true)
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eq("Afghanistan")
    end

    it 'accept a new DOB' do
      expect(@driver.dob_month_list_select('11')).to be(true)
      expect(@driver.dob_day_list_select('12')).to be(true)
      expect(@driver.dob_year_list_select('1993')).to be(true)
    end

    it 'should accept a new country value' do
      expect(@driver.country_dropdown_list_select('Portugal')).to be(true)
    end

    it 'should accept a valid phone number' do
      expect(@driver.get_phone_number_field_value).to be_kind_of(String)
    end

    it 'should accept a username' do
      expect(@driver.get_user_name_field_value).to be_kind_of(String)
    end

    it 'should accept a about yourself text' do
      expect(@driver.get_about_yourself_value).to be_kind_of(String)
    end

    it 'should accept a password' do
      expect(@driver.get_password_value).to be_kind_of(String)
    end

    it 'should accept a password confirmation' do
      expect(@driver.get_confirmation_password_value).to eq(@driver.get_password_value)
    end

  end

end
