class Question < ActiveRecord::Base

  validates :title, :presence => true
  validates :text, :presence => true

  belongs_to :user
  has_many :answers, dependent: :destroy

  has_many :votes, dependent: :destroy
  has_many :upvoters, through: :votes, source: :user

  scope :daily, -> { where(created_at: Time.current.all_day) }

end
