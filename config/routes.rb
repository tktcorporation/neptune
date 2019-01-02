Rails.application.routes.draw do
  root to: 'recipes#index'
  get '/login', to: "login#new"
  resources :recipes, only: [:index]
  resources :cookies, only: [:create, :delete]
  namespace :api, format: 'json' do
    resources :users, only: [:create] do
      collection do
        post :get_auth_token
      end
    end
    resources :recipes, only: [:index, :show]
  end
  namespace :admin do
    resources :recipes
  end
end
