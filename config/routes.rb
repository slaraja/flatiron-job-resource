Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  #don't need a post signup because resources has it covered, and users don't see the URL
  
 
  resources :comments
  resources :jobs
  resources :jobs do
    # nested resource for jobs
    resources :comments, only: [:new, :index]
  end

  resources :companies
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
