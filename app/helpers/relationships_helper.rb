module RelationshipsHelper
  def relationship_button(user)
    if current_user.id != user.id
      if current_user.following? user
        unfollow_button(user)
      else
        follow_button(user)
      end
    end
  end

  private

  def follow_button(user)
    button_to 'Follow', follow_user_path(user)
  end

  def unfollow_button(user)
    button_to 'Unfollow', follow_user_path(user), method: :delete
  end
end
