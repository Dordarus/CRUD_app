class BooksController < ApplicationController

    before_action :find_book, only: [:show, :edit, :update, :destroy]
    before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
    def index
        @books = Book.all        
    end

    def show        
    end

    def new
        @book = Book.new
        @author = Author.find(params[:a_id])
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            render :new
        end
    end

    def edit        
    end

    def update
        if @book.update(book_params)
            redirect_to @book
        else
            render :edit
        end
    end 

    def destroy
        @author = @book.author
        if @book.destroy
            redirect_to author_path(@author)
        else
            redirect_to root
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :genre, :year, :plot, :author_id)
    end

    def find_book
        @book = Book.find(params[:id])
    end

    # Before filters

    def signed_in_user
        unless logged_in?
        redirect_to sign_in_url
      end
    end
end
