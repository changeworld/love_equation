Rails.application.routes.draw do
  root 'static#index'
  post '/achievement' => 'static#achievement'
  post '/prospect' => 'static#prospect'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
