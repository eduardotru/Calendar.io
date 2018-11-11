Rails.application.routes.draw do
  resources :users do
    resources :events
    post 'newFriend'
    get 'friendships'
  end
end
