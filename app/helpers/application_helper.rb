module ApplicationHelper

  def build_title(page_title = '')
    base_title = "すてチャ(仮)"
    if page_title.empty?
      base_title
    else
      page_title + " - " + base_title
    end
  end

  def current_room_id
    if params[:room_id]
      current_room = Room.find_by(code: params[:room_id])
      current_room.id
    else
      return nil
    end
  end

end
