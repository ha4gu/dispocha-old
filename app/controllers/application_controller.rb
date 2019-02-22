class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # devise, ユーザ項目にアイコンである:imageを含められるようにする
  # ※ usernameはすでにログインに必須の要素と扱っているため、追加は不要。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
  end

  # サインアップ後にルームトップを表示
  def after_sign_up_path_for(resource)
    room_path(params[:room_id])
  end

  # ログイン後にルームトップを表示
  def after_sign_in_path_for(resource)
    room_path(params[:room_id])
  end

  # ログアウト後にルームトップを表示
  def after_sign_out_path_for(resource)
    room_path(params[:room_id])
  end

end
