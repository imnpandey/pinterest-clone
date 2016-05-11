module PinsHelper
  def delete_button(pin)
    pin = current_user.pins.find_by(id: pin.id)
    if pin
      button_to 'X', pin_path(pin), class: "button deletebutton",
                 form: { "data-turboboost" => true, "data-remote" => true },
                      :data => {:confirm => 'Are you sure?'}, method: :delete
    end
  end
end
