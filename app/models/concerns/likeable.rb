module Likeable
  extend ActiveSupport::Concern

  def likes? pin, user
    pin = Vote.where(pin_id: pin.id).where(user_id: user.id)
    if pin.empty?
      false
    else
      true
    end
  end
end
