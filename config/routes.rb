LiftClone::Application.routes.draw do
  resource  :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  root 'sessions#new'
end