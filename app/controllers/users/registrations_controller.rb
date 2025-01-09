class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @orders = [ "test2", "test1" ]
    super
  end
end
