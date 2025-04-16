Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: [:index, :create, :show]
  match 'articles/:id', to: 'articles#method_not_allowed', via: [:delete, :put, :patch]
end