Byus::Application.routes.draw do

  get "pages/landing"

  resources :bins, only: [:create] do
    resources :links, only: [:destroy]
  end

  match 'bins/:secret_hash', to: 'bins#show', as: 'bin'

  resources :links, only: [:create]

  root to: 'pages#landing'

end
