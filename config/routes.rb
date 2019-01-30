Rails.application.routes.draw do

  # StaticPages
  root 'static_pages#top'

  # Rooms
  get '/new',    to: 'rooms#new',    as: 'new_room'
  get '/create', to: 'rooms#create', as: 'create_room'

end
