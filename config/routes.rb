Rails.application.routes.draw do
  resources :shoppingcarts
  resources :books
  resources :shopping_carts
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
