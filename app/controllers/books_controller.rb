class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
    end

    #TODO: Add editig and deletion
end
