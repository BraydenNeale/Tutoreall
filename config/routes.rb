Rails.application.routes.draw do
  
  devise_for :students
  resources :students

  devise_for :tutors
  resources :tutors
  
  root 'static#home'
  get 'static/home'
end
