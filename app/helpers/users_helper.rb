module UsersHelper
  def first_name(user)
    user.name.split(' ')[0]
  end

  def delete_button(pin)
    pin = current_user.pins.find_by(id: pin.id)
    if pin
      button_to 'X', pin_path(pin), class: "button deletebutton", method: :delete
    end
  end
end
