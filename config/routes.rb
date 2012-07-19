Bblog::Application.routes.draw do
  # Static Pages
  match "home", to: "static_pages#home"
  match "about", to: "static_pages#about"


  root to: "static_pages#home"
end
