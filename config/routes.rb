Byus::Application.routes.draw do

  resources :bins, only: [:create, :update, :new] do
    match "", to: 'links#index', via: :get
    match '/links', to: 'links#cross_site_sharing', via: :options
    resources :links, only: [:create, :destroy, :index]
  end

  namespace :public do
    resources :bins, only: [] do
      match "", to: 'links#index', via: :get
      resources :links, only: :index
    end
  end

  match '/links/latest', controller: :links, action: :latest, via: :get

  match "b/:bin_id", to: "links#bookmarklet", as: 'bookmarklet'

  # Simple heartbeat check. Don't waste resources
  match 'heartbeat', to: proc { [200, {}, ''.chars] }

  root to: 'bins#new'
end
