Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/discover', to: 'static_pages#discover'
  get '/learn-more-about-yourself', to: 'static_pages#learn_more_about_yourself', as: 'yourself'
  # get '/learn-more-about-yourself/article1', to: 'static_pages#article1', as: 'article1'
  get '/learn-more-about-yourself/:id', to: 'static_pages#article', as: 'article'
  get '/quizzes', to: 'static_pages#quizzes'
  get '/quizzes/quiz1', to: 'static_pages#quiz1', as: 'quiz1'
  # get '/yourself', to: 'static_pages#yourself'
  # get '/yourself', to: 'static_pages#yourself'

  # get '/my-progress', to: 'static_pages#progress', as: 'progress'

  get '/signup', to: 'users#new'
  get '/submit-article', to: 'articles#new', as: 'submit'
  get '/book-an-appointment', to: 'appointments#new', as: 'book_appointment'
  get '/doctor-details/:id', to: 'infos#show', as: 'show_info'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :progress
      get :chat
      get :appointments
    end
  end

  resources :articles, only: [:create, :destroy]
  resources :appointments, only: [:create, :destroy]
  resources :infos





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
