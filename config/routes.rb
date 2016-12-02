Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
  	resources :answers, :controller => 'question_answers'
  	resources :likes, :only => [:create,:destroy]
    resources :subscribes, :only => [:create,:destroy]
    collection do
    	get :about 
	   end
  end	
  
  namespace :admin do
    resources :questions
  end

  namespace :api , path: '' do
    constraints(host:'api.localhost') do
      resources :users
      get '*unmatched_route', to: 'base#page_404'
    end 
  end  

  resources :users do
    collection do
      get :profile
      get :user_profile
    end
  end  
  
  
  
  root :to => "questions#index"
end
