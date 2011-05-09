Byus::Application.routes.draw do

  get "pages/landing"

  resources :bins
  resources :links

  root to: 'pages#landing'

end
