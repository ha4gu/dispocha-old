Rails.application.routes.draw do

  # StaticPages
  root 'static_pages#top'

  # Rooms
  get  '/new',      to: 'rooms#new',    as: 'new_room'
  post '/create',   to: 'rooms#create', as: 'create_room'
  get  '/:room_id', to: 'rooms#show',   as: 'room'
  #post '/:room_id/room_update', to: 'rooms#room_update', as: 'user_update'
  post '/:room_id/user_update', to: 'rooms#user_update', as: 'user_update'

  # devise
  devise_for :users, path: ':room_id', path_names: {
    sign_in: 'login', sign_out: 'logout', sign_up: 'new'
  }

  # Posts
  post '/:room_id/create', to: 'posts#create', as: 'create_post'

end
