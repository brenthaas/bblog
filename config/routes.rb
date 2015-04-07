Bblog::Application.routes.draw do
  # Static Pages
  get "home", to: "blogs#index"
  get "about", to: "static_pages#about"
  root to: "blogs#index"

  # Authentication actions
  post 'sessions', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'

  # User
  get "users/:id", to: "users#show", as: :user

  resources :blogs
  resources :notes
end
