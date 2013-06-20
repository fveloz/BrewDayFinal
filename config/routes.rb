BrewApp::Application.routes.draw do
  get "users/show"
  devise_for :users
  root "brews#index"
  resources :brews
end
