Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  root to: 'foods#index'

  get 'general_shopping_list/index'
  get 'shopping_list', to: 'foods#shopping_list', as: 'shopping_list' 

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show]

  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
    member do
      get 'generate_shopping_list'
      get 'shopping_list', to: 'recipes#shopping_list'
      patch 'toggle_public', to: 'recipes#toggle_public'
    end
  end

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes_index'
end