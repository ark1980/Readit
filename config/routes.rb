Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  resources :advertisments

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
end
