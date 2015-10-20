require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password
  after_create :send_welcome_message

  validates :email, :presence => true, :uniqueness => true

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :votes, dependent: :destroy
  has_many :upvoted_questions, through: :votes, source: :question

  scope :admin, -> { where(admin: true) }

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def send_welcome_message
    WelcomeMessage.welcome_email(self)
  end
end
