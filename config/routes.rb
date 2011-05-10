Byus::Application.routes.draw do
  get "pages/landing"

  resources :bins, only: [:create, :show] do
    resources :links, only: [:create, :destroy]
  end
  match "b/:bin_id", to: "links#create", as: 'bookmarklet'
  resources :links, only: [:new, :create]

  root to: 'links#new'
end
