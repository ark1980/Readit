Rails.application.routes.draw do

  devise_for :users
  resources :advertisments

  resources :topics do
    resources :posts, except: [:index]
  end

  root to: 'welcome#index'

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
end
