# frozen_string_literal: true

Rails.application.routes.draw do
  root 'quotes#new'

  resources :quotes, only: %i[new create show index]
end
