class AuthorsController < ApplicationController

    before_action :find_author, only: [:edit, :update, :show]

    def index
        @authors = Author.all
    end

    def show
        @books = @author.books.all
        @books_any = @books.any?
    end

    def edit
    end

    def update      
        if @author.update(author_params)
            redirect_to @author
        else
            render :edit
        end
    end

    def new
       @author = Author.new
    end   

    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to '/authors'
        else
            render :new
        end
    end   
  
    private 
    def author_params
        params.require(:author).permit(:first_name, :last_name, :bio)
    end

    def find_author
        @author = Author.find(params[:id])
    end
end
