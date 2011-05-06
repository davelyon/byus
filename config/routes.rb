Byus::Application.routes.draw do
  resources :bins

  root to: 'bins#new'

end
