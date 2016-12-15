Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :playlists, :only => [:create, :new, :show]

  resources :tests, :only => [:index]

  get '/auth/spotify/callback', to: 'users#spotify'

  root 'playlists#new'
end
