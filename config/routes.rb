Rails.application.routes.draw do
  
  devise_for :students
  resources :students

  devise_for :tutors
  resources :tutors do
    member do 
      get :dashboard
    end
  end
  
  root 'static#home'
  get 'static/home'

 	resources :conversations, only: [:index, :show, :destroy] do
	  member do
	    post :reply
      post :mark_as_read
	  end
	end

  resources :areas do 
    collection do 
      get :autocomplete
    end
  end

  resources :messages, only: [:new, :create]
  resources :lessons
end
