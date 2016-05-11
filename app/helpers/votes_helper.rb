module VotesHelper
  def vote_button(pin)
    if current_user.likes? pin, current_user
      dislike_button(pin)
    else
      like_button(pin)
    end
  end

  private

  def like_button(pin)
    button_to 'Like', like_pin_path(pin), class: "button likebutton",
                      form: { "data-turboboost" => true, "data-remote" => true }

  end

  def dislike_button(pin)
    button_to 'Unlike', like_pin_path(pin), class: "button unlikebutton",
                        form: { "data-turboboost" => true, "data-remote" => true },
                        method: :delete
  end
end
