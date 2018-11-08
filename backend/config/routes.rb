Rails.application.routes.draw do
  resources :users do
    resources :events
    #get '/users/id/friends', to: ''
  end
end
