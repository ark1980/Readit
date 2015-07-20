Rails.application.routes.draw do

  devise_for :users
  resources :advertisments
  resources :posts
  resources :topics
  root to: 'welcome#index'

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
end
