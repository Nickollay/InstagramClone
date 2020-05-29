Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/posts', to: 'posts#index'
  root 'posts#index'

  resources :users, only: [:show, :edit, :update, :all] do
    resources :posts do
      resources :comments
    end
  end

  #, only: [:new, :create, :index, :edit, :update, :show, :destroy]

end
