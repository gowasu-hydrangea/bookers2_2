class ApplicationController < ActionController::Base
   # A46
   # ア・２＞21章＞権限の設定をする
   before_action :authenticate_user!, except: [:top]
   before_action :configure_permitted_parameters, if: :devise_controller?

  # A25
  # ア・2＞7章
  def after_sign_in_path_for(resource)
  #   ログイン後のリンク先が/users/id番号(ログインユーザーのid)
  # 遷移先がshowページ
    user_path(current_user.id)
    # A39
    # ユーザーログインが成功した時
    # flash.now[:success] = "Welcome! You have signed up successfully."
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
