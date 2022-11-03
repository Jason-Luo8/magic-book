Rails.application.routes.draw do
  get 'session/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'pages#home'

  resources :authors

  resources :users

  resources :users, :only => [:show] do
    resources :bookmarks, only: [:show, :new, :edit]
  end

  resources :books, params: :isbn
end
