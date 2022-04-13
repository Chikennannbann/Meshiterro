class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
     about_path
   end
  # Deviseの初期設定がroot_pathのため変更

   def after_sign_out_path_for(resource)
     about_path
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # ストロングパラメータと同様
  # privateは記述したコントローラ内のみ参照
  # protectedは呼び出された他のコントローラからも参照可能
end
