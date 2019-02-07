class ApplicationController < ActionController::Base
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
