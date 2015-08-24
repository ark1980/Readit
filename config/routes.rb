Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  resources :advertisments
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
end
