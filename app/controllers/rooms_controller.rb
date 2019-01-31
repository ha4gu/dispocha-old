class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(user_params)
    if @room.save
      # 保存に成功した場合の処理
      flash[:success] = "ルームが作成されました。"
      redirect_to root_path
    else
      # 保存に失敗した場合の処理
      flash.now[:danger] = "ルームの作成に失敗しました。"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:room).permit(:code, :name)
  end

end
