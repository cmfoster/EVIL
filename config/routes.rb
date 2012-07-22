EVEL::Application.routes.draw do
  root :to => 'home#index'
  
  resources :corporations, :only => [:create,:index] do
    # resources :targets, :only => [:create, :update, :index]
    
  end
  
  resources :users do
    get :reload
    match "/new_target" => "users#create_or_update_target"
  end
end
