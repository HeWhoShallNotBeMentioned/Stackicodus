require 'rails_helper'

describe User do
  it { should validate_presence_of :email}
  it { should validate_uniqueness_of :email}
  it { should have_many :questions}
  it { should have_many :answers}
  it { should have_many :comments}
  it {should have_many :votes}
  it {should have_many :upvoted_questions}

end
