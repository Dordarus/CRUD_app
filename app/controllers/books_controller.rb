class BooksController < ApplicationController

    before_action :find_book, only: [:show, :edit, :update, :destroy]

    #done
    def index
        @books = Book.all        
    end

    #done
    def show        
    end

    #done
    def new
        @book = Book.new
        @author = Author.find(params[:a_id])
    end

    #done
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            render :new
        end
    end

    #done
    def edit        
    end

    #done
    def update
        if @book.update(book_params)
            redirect_to @book
        else
            render :edit
        end
    end 

    #TODO
    def destroy
    end

    #done
    private
    def book_params
        params.require(:book).permit(:title, :genre, :year, :plot, :author_id)
    end

    #done
    def find_book
        @book = Book.find(params[:id])
    end
end
