class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_guest, only: [:destroy, :update]


  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :date_of_birth, :sex])
  end

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, notice: 'ゲストユーザーの編集・削除できません。'
    end
  end

end
