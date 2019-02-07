class StaticPagesController < ApplicationController

  def top
    @rooms = Room.all
  end

end
