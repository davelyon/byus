Byus::Application.routes.draw do
  get "pages/landing"

  resources :bins, only: [:create, :update, :show, :new] do
    resources :links, only: [:create, :destroy]
  end
  match "b/:bin_id", to: "links#create", as: 'bookmarklet'
  # resources :links, only: [:new, :create]

  root to: 'bins#new'
end
