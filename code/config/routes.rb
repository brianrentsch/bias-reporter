Rails.application.routes.draw do
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home/index'
end
