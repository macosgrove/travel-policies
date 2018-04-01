Rails.application.routes.draw do
  root 'quotes#new'

  resources :quotes, only: [:new, :create, :show, :index]
end
