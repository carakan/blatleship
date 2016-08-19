Rails.application.routes.draw do
  resources :games
  root to: 'visitors#index'
end
