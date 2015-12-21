Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create, :edit, :update, :index]
  end

  resources :songs, only: [:show]
end
