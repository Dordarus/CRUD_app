require 'rails_helper'

RSpec.describe "Authors", type: :request do
  before do
    @author = Author.create(first_name: "George", last_name: "Orwell", bio: "An English novelist, essayist, journalist, and critic.")
    @book = Book.create( title: "Some book", genre: "some genre", year: 1234, plot: "Some plot", author_id: @author.id)
end

let(:author_id){@author.id}

subject{ page }

 describe "GET authors/show/:id" do
   before{visit author_path(author_id)}
   it {should have_http_status(200)} 
 end

 describe "GET /authors" do
   before{visit authors_index_path}
   it {should have_http_status(200)} 
 end

 describe "GET authors/new" do
   before{visit new_author_path(author_id)}
   it {should have_http_status(200)} 
 end

 describe "GET /authors/:id/edit" do
   before{visit edit_author_path(author_id)}
   it {should have_http_status(200)} 
 end
end
