Byus::Application.routes.draw do

  get "pages/landing"

  resources :bins, only: [:create, :destroy]

  match 'bins/:secret_hash', to: 'bins#show'

  resources :links

  root to: 'pages#landing'

end
