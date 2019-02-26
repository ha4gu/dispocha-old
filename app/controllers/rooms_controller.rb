class RoomsController < ApplicationController
  before_action :check_signed_in, only: [:show, :user_update]
  before_action :check_correct_room, only: [:show, :user_update]

  def new
    @room = Room.new
    # ルームID（.code）の初期値を自動生成する
    if @room.code.nil?
      until @room.has_valid_code?
        @room.code = Room.random_code
      end
    end
  end

  def create
    @room = Room.new(room_params)
    if @room.save # 保存に成功した場合
      flash[:success] = "ルームが作成されました。"
      flash[:info] = "ユーザ登録を行ってください。"
      redirect_to new_user_registration_path(@room.code) # ユーザ新規登録へ移動
    else # 保存に失敗した場合
      flash.now[:danger] = "ルームの作成に失敗しました。"
      render 'new'
    end
  end

  def show
    @post = Post.new
    @room = Room.find_by(code: params[:room_id])
    # ルームが見つからない場合にはトップページへ移動
    if @room.nil?
      flash[:warning] = "ルーム #{params[:room_id]} が見つかりません。"
      redirect_to root_path
    end
  end

  def user_edit
    @user = User.find(current_user.id)
  end

  def user_update
    @user = User.find(current_user.id)
    @room = Room.find_by(code: params[:room_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to room_path(params[:room_id])
    else
      flash.now[:danger] = "Failed to update user info"
      render 'devise/registrations/edit'
    end

  end


  private

  def room_params
    params.require(:room).permit(:code, :name)
  end

  def user_params
    params.require(:user).permit(:name, :display_name, :icon)
  end

  # before_actions

  def check_signed_in
    room = Room.find_by(code: params[:room_id])
    unless user_signed_in?
      flash[:danger] = "ログインしてください。"
      redirect_to new_user_session_path(room.code)
    end
  end

  def check_correct_room
    unless current_user.room.code == params[:room_id]
      flash[:danger] = "ログイン中のアカウントではこのルームにアクセスできません。
                        一度ログアウトしてからログインし直してください。"
      redirect_to root_path
    end
  end
end
