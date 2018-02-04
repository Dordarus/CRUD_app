Rails.application.routes.draw do
  resources :users
  root 'pages#home'

  #start page routes
  get '/sign_up' => 'users#new', as: :sign_up
  get '/sign_in' => 'sessions#new', as: :sign_in

  #session routes
  post   '/sign_in' => 'sessions#create'
  delete '/sign_out'=> 'sessions#destroy', as: :sign_out


  #authors routes
  get '/authors'=>'authors#index', as: :authors_index
  get '/authors/new'=> 'authors#new', as: :new_author
  post '/authors'=>'authors#create'
  get '/authors/:id' => 'authors#show', as: :author
  get '/authors/:id/edit'=>'authors#edit', as: :edit_author
  patch '/authors/:id' => 'authors#update'
  #books routes
  get '/books' => 'books#index', as: :books_index
  get '/books/new/:a_id'=> 'books#new', as: :new_book
  post '/books'=>'books#create'
  get '/books/:id'=> 'books#show', as: :book
  get '/books/:id/edit'=>'books#edit', as: :edit_book
  patch '/books/:id' => 'books#update'
  delete '/books/:id' => 'books#destroy'


end
