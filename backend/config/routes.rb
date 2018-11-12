Rails.application.routes.draw do
  resources :users do
    resources :events
    post 'newFriend'
    get 'friendships'
    get 'findUsers'
  end
  resources :login
end
