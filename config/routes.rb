Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_stock', to: 'stocks#search'
  get 'search_people', to: 'users#search'
  resources :friendships
end
