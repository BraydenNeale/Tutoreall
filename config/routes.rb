Rails.application.routes.draw do

  # js validations
  # mount Judge::Engine => '/judge'

  get 'transactions/new'
  root 'static#home'

  devise_for :students, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  devise_for :tutors, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  # devise_for :students
  # devise_for :tutors

  controller :static do 
    get :home
    get :about
    get :terms_of_use
    get :privacy_policy
  end

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

  resources :subjects do 
    collection do 
      get :autocomplete_faculty
    end
  end

  resources :lessons, except: [:index] do 
    member do
      put :approve
      put :cancel
    end
  end

  resources :messages, only: [:new, :create]
  resources :transactions, only: [:new, :create]
  resources :searches, only: [:create]
  # resources :searches
end
