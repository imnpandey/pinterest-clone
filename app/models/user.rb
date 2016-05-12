class User < ActiveRecord::Base
  include Likeable
  include Followable

  has_many :votes
  has_many :pins
  has_many :comments

  has_many :voted_pins, :through => :votes, :source => :pin
  has_many :pin_votes, :through => :pins, :source => :votes

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    user = check_for_create_user(auth, user) unless user
    create_user_identity(identity, user)
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def self.check_for_create_user(auth, user)
    user = check_email(auth, user) unless user
    create_user(auth) unless user
  end

  def self.check_email(auth, user)
    email = auth.info.email
    User.where(:email => email).first if email
  end

  def self.create_user(auth)
    user = User.new(
          name: auth.extra.raw_info.name,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
  end

  def self.create_user_identity(identity, user)
    if identity.user != user
      identity.user = user
      identity.save!
    end
  end
end
