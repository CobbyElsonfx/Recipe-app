
Rails.application.routes.draw do
  get 'general_shopping_list/index'

  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show] do
    member do
      post 'generate_shopping_list'
      get 'generate_shopping_list'
    end
  end

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes_index'

  root 'foods#index'
end