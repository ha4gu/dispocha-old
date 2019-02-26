Rails.application.routes.draw do

  # StaticPages
  root 'static_pages#top'

  # Rooms
  get  '/new',      to: 'rooms#new',    as: 'new_room'
  post '/new',      to: 'rooms#create', as: 'create_room'
  get  '/:room_id', to: 'rooms#show',   as: 'room'
  # get   '/:room_id/room_edit', to: 'rooms#room_edit',   as: 'room_edit'   # あとで作る
  # patch '/:room_id/room_edit', to: 'rooms#room_update', as: 'room_update' # あとで作る
  get   '/:room_id/user_edit', to: 'rooms#user_edit',   as: 'user_edit'
  patch '/:room_id/user_edit', to: 'rooms#user_update', as: 'user_update'

  # devise
  devise_for :users, path: ':room_id', path_names: {
    sign_in: 'login', sign_out: 'logout', sign_up: 'new'
  }

  # Posts
  post '/:room_id/create', to: 'posts#create', as: 'create_post'

end
