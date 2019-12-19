Rails.application.routes.draw do
  #get 'welcome/index'
  get 'inicio', to: 'welcome#index'
  resources :welcome
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
