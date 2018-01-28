Rails.application.routes.draw do
  get '/authors'=>'authors#index'
  get '/authors/new'=> 'authors#new', as: :new_author
  get '/authors/:id' => 'authors#show', as: :author
  post '/authors'=>'authors#create'
  get '/authors/:id/edit'=>'authors#edit', as: :edit_author
  patch '/authors/:id' => 'authors#update'
  get '/books/:id'=> 'books#show', as: :book

end
