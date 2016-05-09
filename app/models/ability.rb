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
    cannot [:create], [Pin]
    cannot [:create], [Comment]
    cannot [:create], [Vote]
  end

  def cans
    can [:create], [Pin]
    can [:create], [Comment]
    can [:create], [Vote]
  end
end
