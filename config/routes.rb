Rails.application.routes.draw do
  namespace :api, format: 'json' do
    resources :recipes, only: [:index, :show, :create, :update]
  end
end
