Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/posts', to: 'posts#index'
  root 'posts#index'
  resources :posts do
    resources :comments
  end

  #, only: [:new, :create, :index, :edit, :update, :show, :destroy]

end
