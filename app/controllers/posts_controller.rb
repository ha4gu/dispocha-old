class PostsController < ApplicationController
  def create
    @room = Room.find_by(code: params[:room_id])
    @post = Post.new(user_params)
    if @post.save
      # 保存に成功した場合の処理
      #flash[:success] = "ポスト成功" # うるさいので抑制
      redirect_to room_path(@room.code)
    else
      # 保存に失敗した場合の処理
      flash.now[:danger] = "ポスト失敗"
      render 'rooms#show'
    end
  end

  private

  def user_params
    params.require(:post).permit(:room_id, :user_id, :content)
  end
end
