module CommentsHelper
  def delete_comment_button(comment)
    comm = current_user.comments.find_by(id: comment.id)
    if comm
      button_to 'X', pin_comment_path(id: comm.id, pin_id: comm.pin_id),
              class: "button deletebutton", :data => {:confirm => 'Are you sure?'}, method: :delete
    end
  end
end
