LiftClone::Application.routes.draw do
  resource  :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resources :goals, shallow: true
  end
  root 'sessions#new'
end