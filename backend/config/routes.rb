Rails.application.routes.draw do
  resources :users do
    resources :events
    post 'friends'
  end
end
