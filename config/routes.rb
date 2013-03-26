Zipmark::Application.routes.draw do
  devise_for :users

  resources :marks, :only => [:new, :create, :destroy]

  root :to => 'dashboard#index'
end
