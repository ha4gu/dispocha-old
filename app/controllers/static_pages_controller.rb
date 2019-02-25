class StaticPagesController < ApplicationController

  def top
    # 開発環境の場合のみ、デバッグ表示のためにルーム一覧を取得しておく
    if Rails.env.development?
      @rooms = Room.all
    end
  end

end
