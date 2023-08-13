Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/discover', to: 'static_pages#discover'
  get '/discover/:keyword', to: 'static_pages#keyword', as: 'static_keyword'
  get '/learn-more-about-yourself', to: 'static_pages#learn_more_about_yourself', as: 'yourself'
  get '/mental-health', to: 'static_pages#mental_health', as: 'mental'
  get '/quizzes', to: 'static_pages#quizzes'
  get '/quizzes/quiz1', to: 'static_pages#quiz1', as: 'quiz1'
  get '/quizzes/quiz2', to: 'static_pages#quiz2', as: 'quiz2'

  get '/article/:id', to: 'articles#show', as: 'show_article'
  get '/submit-article', to: 'articles#new', as: 'submit'
  get '/article/:id/edit', to: 'articles#edit', as: 'edit_article'

  get '/book-an-appointment', to: 'appointments#new', as: 'book_appointment'

  get '/create-doctor-details', to: 'infos#new', as: 'create_info'
  get '/doctor-details/:id', to: 'infos#show', as: 'show_info'
  get '/doctor-details/:id/edit', to: 'infos#edit', as: 'edit_info'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :progress
      get :appointments
      get :choice_game
    end
  end

  get '/moods/:id/edit', to: 'moods#edit_partial', as: 'edit_partial'
  resources :articles, only: [:new, :create, :destroy, :edit, :update]
  resources :appointments, only: [:new, :create, :destroy]
  resources :infos, only: [:new, :create, :edit, :update]
  resources :moods, only: [:new, :create, :update]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
