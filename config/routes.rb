Rails.application.routes.draw do
  # lists routes
  root 'lists#index'
  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new'
  # get 'lists/:id', to: 'lists#show', as: 'list'
  # post 'lists', to: 'lists#create'

  # bookmarks routes
  resources :lists, only: [:index, :new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
end
