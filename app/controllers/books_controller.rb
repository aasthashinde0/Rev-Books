class BooksController < ApplicationController
    before_action :set_book, only: %i[ show edit update destroy ]


    def index
        @books = Book.all
    end 
    
    def show
    end

    def new
        @book = Book.new    
    end

    def edit 
    end 

    def destroy
       
        @book.destroy!
        
        respond_to do |format|
          format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
          format.json { head :no_content }
        end
      end

    def update 
        respond_to do |format|
            if @book.update(book_params)
              format.html { redirect_to @book, notice: "Book was successfully updated." }
              format.json { render :show, status: :ok, location: @book }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @book.errors, status: :unprocessable_entity }
            end
          end
    end  

    def create
      @book = Book.new(book_params)
      respond_to do |format|
        if @book.save
          format.html { redirect_to @book, notice: "Book was successfully created." }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def book_params
      params.require(:book).permit(:title, :description, :isbn, :author_id)
    end
    

    def set_book
            @book = Book.find(params[:id])
    end
end
