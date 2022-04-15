class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  # authenticate_userメソッドは、devise側が用意しているメソッドです。
  # :authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。

  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
     post_images_path
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
