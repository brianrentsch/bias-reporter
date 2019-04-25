Rails.application.routes.draw do  
  resources :reports, :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home/index'
  get '/track_reports', to: 'track_reports#index' 
  get 'about/index'
  post '/track_reports', to: 'track_reports#create'
  get '/login', to: 'faculty_sessions#new'
  post '/login', to: 'faculty_sessions#create'
  delete '/logout', to: 'faculty_sessions#destroy'

end

