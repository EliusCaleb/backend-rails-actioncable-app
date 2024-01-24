Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
 
  resources :messages, only: %i[index]
  resources :users, only: %i[index create] do
    post 'add_message'
    post 'change_status'
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
