Rails.application.routes.draw do
  root 'authors#index'
  #authors routes
  get '/authors'=>'authors#index'
  get '/authors/new'=> 'authors#new', as: :new_author
  post '/authors'=>'authors#create'
  get '/authors/:id' => 'authors#show', as: :author
  get '/authors/:id/edit'=>'authors#edit', as: :edit_author
  patch '/authors/:id' => 'authors#update'
  #books routes
  get '/books' => 'books#index'
  get '/books/new/:a_id'=> 'books#new', as: :new_book
  post '/books'=>'books#create'
  get '/books/:id'=> 'books#show', as: :book
  get '/books/:id/edit'=>'books#edit', as: :edit_book
  patch '/books/:id' => 'books#update'
end
