class RoomsController < ApplicationController

  def new
    @room = Room.new
    # 初期値の設定
    if @room.code.nil? # 保存失敗時に上書きしないように
      @room.code = Room.random_code
      until @room.has_valid_code?
        @room.code = Room.random_code
      end
    end
  end

  def create
    @room = Room.new(user_params)
    if @room.save
      # 保存に成功した場合の処理
      flash[:success] = "ルームが作成されました。"
      redirect_to room_path(@room.code)
    else
      # 保存に失敗した場合の処理
      flash.now[:danger] = "ルームの作成に失敗しました。"
      render 'new'
    end
  end

  def show
    @room = Room.find_by(code: params[:room_id])
    # ルームが見つからない場合
    if @room.nil?
      flash[:warning] = "ルーム #{params[:room_id]} が見つかりません。"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:room).permit(:code, :name)
  end



end
