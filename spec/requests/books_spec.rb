require 'rails_helper'

RSpec.describe "Books", type: :request do
 before do
     @author = Author.create(first_name: "George", last_name: "Orwell", bio: "An English novelist, essayist, journalist, and critic.")
     @book = Book.create( title: "Some book", genre: "some genre", year: 1234, plot: "Some plot", author_id: @author.id)
 end
 
 let(:book_id){@book.id}
 let(:book_author_id){@book.author.id}

 subject{ page }

  describe "GET /show/:id" do
    before{visit book_path(book_id)}
    it {should have_http_status(200)} 
  end

  describe "GET /books" do
    before{visit books_index_path}
    it {should have_http_status(200)} 
  end

  describe "GET /books/new/:a_id" do
    before{visit new_book_path(book_author_id)}
    it {should have_http_status(200)} 
  end

  describe "GET /new/1" do
    before{visit edit_book_path(book_id)}
    it {should have_http_status(200)} 
  end
end
