module Followable
  extend ActiveSupport::Concern

  included do
    has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
    has_many :followings, through: :active_relationships, source: :followed

    has_many :passive_relationships, class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
  end

  def following? user
    following_ids.include? user.id
  end

  def follow user
    followings << user
  end

  def unfollow user
    followings.delete(user)
  end
end
