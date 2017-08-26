Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'registrations_modified'
  }
  get 'current_user' => 'users#current_user'
  root 'todos#index'
  resources :todos
  resources :projects
end
