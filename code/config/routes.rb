Rails.application.routes.draw do
  get 'schools/new'
  get 'faculty_sessions/new'
  resources :reports #, :track_reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home/index'
  get '/track_reports', to: 'track_reports#index' #'track_reports/index'
  get 'about/index'
  post '/track_reports', to: 'track_reports#create'
end
