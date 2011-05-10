Byus::Application.routes.draw do
  get "pages/landing"

  resources :bins, only: [:create, :show] do
    resources :links, only: [:create, :destroy]
  end
  resources :links, only: [:new, :create]

  root to: 'links#new'
end
