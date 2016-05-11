module CommentsHelper
  def delete_comment_button(comment)
    commented = current_user.comments.find_by(id: comment.id)
    if commented
      button_to 'X', pin_comment_path(id: commented.id, pin_id: commented.pin_id),
              form: { "data-turboboost" => true, "data-remote" => true },
              class: "button deletebutton", :data => {:confirm => 'Are you sure?'}, method: :delete
    end
  end

  def last_comments(pin)
    pin.comments.last(2).reverse
  end
end
