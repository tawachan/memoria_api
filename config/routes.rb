Rails.application.routes.draw do
  root 'todos#index'
  devise_for :users
  resources :todos
end
