Rails.application.routes.draw do
  root 'static#index'
  get  '/achievement' => 'static#index'
  post '/achievement' => 'static#achievement'
  get  '/prospect'    => 'static#index'
  post '/prospect'    => 'static#prospect'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
