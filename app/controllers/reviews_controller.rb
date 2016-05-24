class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	def index
		@reviews = Review.all.order("created_at desc")
	end
	def new
		@review = Review.new
	end
	def create
		@review = Review.new review_params

		if @review.save
			redirect_to @review, notice: "Review added"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @review.update review_params
			redirect_to @review, notice: "Updated Review"
		else
			render 'edit'
		end
	end


	private

	def find_review
		@review = Review.find(params[:id])
	end
	def review_params
		params.require(:review).permit(:title, :content, :category, :link)
	end
end


