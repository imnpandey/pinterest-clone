class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.email.include?('twitter.com')
      cannots
    else
      cans
    end
  end

  private

  def cannots
    cannot [:create, :destroy], [Pin, Pin]
    cannot [:create, :destroy], [Comment, Comment]
    cannot [:create, :destroy], [Vote, Vote]
  end

  def cans
    can [:create, :destroy], [Pin, Pin]
    can [:create, :destroy], [Comment, Comment]
    can [:create, :destroy], [Vote, Vote]
  end
end
