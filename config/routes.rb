Rails.application.routes.draw do
  # js validations
  # mount Judge::Engine => '/judge'

  get 'transactions/new'
  root 'static#home'

  devise_for :students, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  devise_for :tutors, :controllers => {sessions: 'sessions', registrations: 'registrations'}

  match "/sitemap1.xml.gz" => "sitemaps#show", via: :get

  controller :static do 
    get :home
    get :about
    get :terms_of_use
    get :privacy_policy
    get :how_it_works
    get :dispute_resolution
  end

  resources :tutors do
    member do 
      get :dashboard
      get :calendar
      patch :join_organisation
      patch :add_bank_account
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
      get :partial_chat
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
      get :new_partial
      get :pay_for
    end
  end
 
  # resources :organisations do 
  #   collection do 
  #     get :autocomplete
  #   end
  # end

  resources :messages, only: [:new, :create]
  resources :transactions, only: [:new, :create]
  resources :searches, only: [:create]
  # resources :searches
end
