Rails.application.routes.draw do
  # get 'recipe/id' => 'recipes/id'
  # get 'campaigns/:slug' => 'campaigns#show'
  root 'users#index'
  resources :activities
  resources :friendships
  resources :users do
    resources :recipes 
  end
  # resources :recipe
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
