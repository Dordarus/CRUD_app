Rails.application.routes.draw do
  get '/authors'=>'authors#index'
  get '/authors/:id' => 'authors#show', as: :author
  get '/books'=>'books#index'
  get '/books/:id'=> 'books#show', as: :book
end
