class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # devise, ユーザ項目にアイコンである:iconを含められるようにする
  # ※ usernameはすでにログインに必須の要素と扱っているため、追加は不要。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:icon])
    devise_parameter_sanitizer.permit(:edit, keys: [:icon])
  end

  # サインアップ後にルームトップを表示
  def after_sign_up_path_for(resource)
    room_path(params[:room_id])
  end

  # ログイン後にルームトップを表示
  def after_sign_in_path_for(resource)
    room_path(params[:room_id])
  end

  # ログアウト後にサイトトップを表示
  def after_sign_out_path_for(resource)
    root_path
  end

end
