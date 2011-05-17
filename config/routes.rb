Byus::Application.routes.draw do

  resources :bins, only: [:create, :update, :new] do
    match "", to: 'links#index', via: :get
    resources :links, only: [:create, :destroy, :index] do
    end
  end
  match "b/:bin_id", to: "links#create", as: 'bookmarklet'

  root to: 'bins#new'
end
