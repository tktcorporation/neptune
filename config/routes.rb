Rails.application.routes.draw do
  resources :recipes, only: [:index]
  namespace :api, format: 'json' do
    resources :recipes, only: [:index, :show]
  end
  namespace :admin do
    resources :recipes, only: [:index, :edit, :update, :create]
  end
end
