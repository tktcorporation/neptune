Rails.application.routes.draw do
  resources :recipes, only: [:index]
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
