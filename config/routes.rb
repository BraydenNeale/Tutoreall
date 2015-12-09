Rails.application.routes.draw do
  
  get 'transactions/new'

  root 'static#home'
  get 'static/home'

  devise_for :students
  resources :students

  devise_for :tutors
  resources :tutors do
    member do 
      get :dashboard
      get :calendar
    end
  end

  resources :students do 
    member do 
      get :dashboard 
      get :calendar
      get :braintree
      patch :braintree_create
    end
  end

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

  resources :lessons do 
    member do
      put :approve
      put :cancel
    end
  end

  resources :messages, only: [:new, :create]
  resources :lessons
  resources :transactions, only: [:new, :create]
end
