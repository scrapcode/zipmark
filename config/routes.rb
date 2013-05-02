Zipmark::Application.routes.draw do
  devise_for :users

  resources :marks, :only => [:new, :create, :destroy]

  root :to => 'dashboard#index'

  match 'dashboard/tags/:tag' => 'dashboard#show_user_tags', as: :tag
  match 'tags/:tag' => 'dashboard#show_all_tags', as: :all_tag
  
  match '/marks/new/:title/*url' => 'marks#new', :format => false, :constraints => { :url => /.*/, :title => /.*/ }, as: :add_mark
end
