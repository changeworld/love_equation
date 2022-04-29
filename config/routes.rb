Rails.application.routes.draw do
  root 'static#index'
  get  '/achievement' => 'static#index'
  post '/achievement' => 'static#achievement'
  get  '/prospect'    => 'static#index'
  post '/prospect'    => 'static#prospect'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
