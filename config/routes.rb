Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/learn-more-about-yourself', to: 'static_pages#learn_more_about_yourself', as: 'yourself'
  get '/learn-more-about-yourself/article1', to: 'static_pages#article1', as: 'article1'
  # get '/yourself', to: 'static_pages#yourself'
  # get '/yourself', to: 'static_pages#yourself'


  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
