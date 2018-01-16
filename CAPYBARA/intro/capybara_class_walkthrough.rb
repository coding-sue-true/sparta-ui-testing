require 'capybara/dsl'

class BbcHomepage

  HOMEPAGE_URL = 'https://www.bbc.co.uk/'
  SIGN_IN_LINK_ID = '#idcta-link'
  EMAIL_OR_USERNAME_INPUT = 'username'
  PASSWORD_INPUT = 'password'
  SUBMIT_BUTTON = '#submit-button'

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end

    @driver = Capybara::Session.new(:chrome)
  end

  def visit_home_page
    @driver.visit(HOMEPAGE_URL)
  end

  def click_sign_in_button
    @driver.find(SIGN_IN_LINK_ID).click
    #or
    #@driver.click_link(SIGN_IN_LINK_ID)
  end

  def insert_email_or_username
    @driver.fill_in(EMAIL_OR_USERNAME_INPUT, with: 'coding_sue@icloud.com')
  end

  def insert_password
    @driver.fill_in(PASSWORD_INPUT, with: 'Testing123')
  end

  def click_submit_button
    @driver.find(SUBMIT_BUTTON).click
    sleep 7
  end


end

test1 = BbcHomepage.new
test1.visit_home_page
test1.click_sign_in_button
test1.insert_email_or_username
test1.insert_password
test1.click_submit_button
