Rails.application.routes.draw do

  # StaticPages
  root 'static_pages#top'

  # Rooms
  get  '/new',      to: 'rooms#new',    as: 'new_room'
  post '/create',   to: 'rooms#create', as: 'create_room'
  get  '/:room_id', to: 'rooms#show',   as: 'room'

end
