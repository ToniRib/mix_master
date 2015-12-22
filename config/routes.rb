Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create, :edit, :update, :index]
  end

  resources :songs, only: [:show, :index, :destroy]
  resources :playlists, only: [:index, :new, :create, :show]

  root to: "artists#index"
end
