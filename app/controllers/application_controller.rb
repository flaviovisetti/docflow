class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resources)
    @user = User.where(person_id: current_person.id)
    user_path(@user.ids)
  end
end
