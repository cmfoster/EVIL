EVEL::Application.routes.draw do
  root :to => 'home#index'
  
  resources :corporations, :only => [:create]

  resources :users do
    get :reload
  end
end
