Rails.application.routes.draw do
  get 'forecast/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "forecast#show"
end
