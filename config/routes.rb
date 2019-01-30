Rails.application.routes.draw do
  get 'rooms/new'
  root 'static_pages#top'
end
