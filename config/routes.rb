Rails.application.routes.draw do

  root 'home#index'
  get '/about', to: 'home#about'
  get '/help', to: 'home#help'
  devise_for :users
   resources :projects do
    resources :user_projects
    resources :bugs
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
