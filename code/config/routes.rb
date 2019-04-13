Rails.application.routes.draw do
  resources :reports, :track_reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home/index'
  get 'track_reports/index'
  get 'about/index'
end
