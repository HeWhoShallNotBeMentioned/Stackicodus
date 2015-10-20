require 'rails_helper'

describe "the add a new question process" do
  it "adds a new question" do
     test_user = FactoryGirl.create(:user)
     click_on "Ask a Question"
     fill_in "title", :with => "What am I doing?"
     fill_in "text", :with => "Seriously."
     click_on "Ask"
     question.text.should eq "Seriously"
   end
end
