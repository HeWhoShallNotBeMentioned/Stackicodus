class Answer < ActiveRecord::Base

  validates :text, :presence => true

  belongs_to :user
  belongs_to :question

  has_many :comments

end
