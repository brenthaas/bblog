Bblog::Application.routes.draw do
  # Static Pages
  match "home", to: "blogs#index"
  match "about", to: "static_pages#about"
  root to: "blogs#index"

  # Authentication actions
  match 'sessions', to: 'sessions#create', via: :post
  match 'login', to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete

  # User
  match "users/:id", to: "users#show", as: :user

  resources :blogs
  resources :notes
end
