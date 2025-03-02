class ReviewsController < ApplicationController
    before_action :set_book  # Ensures book exists before creating reviews
  
    def create
      @review = @book.reviews.build(review_params)  # No user_id needed
  
      if @review.save
        redirect_to @book, notice: "Review added successfully."
      else
        redirect_to @book, alert: "Review could not be added."
      end
    end
  
    def destroy
      @review = @book.reviews.find(params[:id])
      @review.destroy
      redirect_to @book, notice: "Review deleted successfully."
    end
  
    private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def review_params
      params.require(:review).permit(:rating, :comment)  # Remove :user_id
    end
  end
  