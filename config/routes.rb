Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
  	resources :answers, :controller => 'question_answers'
  	collection do
    	get :about 
    	get :profile
      get :user_profile
	   end
  end	

  root :to => "questions#index"
end
