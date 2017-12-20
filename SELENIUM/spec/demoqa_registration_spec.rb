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
      @driver.set_first_name_field('Soraia')
      expect(@driver.first_name_field_displayed).to be(true)
    end

    it 'should accept a last name' do
      @driver.set_last_name_field('Carmo')
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
      @driver.dob_month_list_select('11')
      @driver.dob_day_list_select('12')
      @driver.dob_year_list_select('1993')
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select('Portugal')
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field("07840873640")
      expect(@driver.get_phone_number_field_value).to eq("07840873640")
    end

    it 'should accept a username' do
      @driver.set_user_name_field('soraia123456c')
      expect(@driver.get_user_name_field_value).to eq('soraia123456c')
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field('ueifiuebf skbeiuf ehfbieufiue wwebiewu')
      expect(@driver.get_about_yourself_value).to eq('ueifiuebf skbeiuf ehfbieufiue wwebiewu')
    end

    it 'should accept a password' do
      @driver.set_password_field('abcde1234')
      expect(@driver.get_password_value).to eq('abcde1234')
    end

    it 'should accept a password confirmation' do
      expect(@driver.get_password_value).to eq('abcde1234')
    end

  end

end
