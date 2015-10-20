require 'rails_helper'

describe "the add a new question process" do
  def log_in (user)
    visit questions_path
    click_on "Log In"
    fill_in "email", :with => user.email
    fill_in "password", :with => user.password
    click_on "Log in"
  end

  it "adds a new question" do
    user = FactoryGirl.create(:user)
    log_in(user)
    visit root_path
    click_link "Ask a Question"
    fill_in "Title", :with => "What is life?"
    fill_in "Text", :with => "Nothing"
    click_on "Ask"
    expect(page).to have_content "Ask a Question"
  end
end
