Rails.application.routes.draw do






  root "complaints#index"
  # Authentication routes for patients
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  # Users - custom routes for patients, registration, profile, editing etc
  get "register" => "patients#new"
  post "register" => "patients#create"
  get "profile" => "patients#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :appointments
  resources :complaints

end
