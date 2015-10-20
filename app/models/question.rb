class Question < ActiveRecord::Base

  validates :title, :presence => true
  validates :text, :presence => true

  belongs_to :user
  has_many :answers

  scope :daily, -> { where(created_at: Time.current.all_day) }

end
