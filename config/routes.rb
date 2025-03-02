
Rails.application.routes.draw do
  resources :authors
  resources :books do
    resources :reviews, only: [:create, :destroy]
  end

  # Define the root path
  root "books#index"
end
