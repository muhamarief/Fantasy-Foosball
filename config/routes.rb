Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  namespace :auth do
    resources :admins, only: [:new, :create, :destroy]
  end

  get 'teams', to: 'teams#index', as: 'teams'
  get 'players', to: 'users#index', as: 'players'
  get 'matches', to: 'matches#index', as: 'matches'

  resources :teams, except: [:new, :index, :edit]
  resources :users, except: [:new, :index, :edit]


end
