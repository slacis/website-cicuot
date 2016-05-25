class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	def index
		@reviews = Review.all.order("created_at desc").paginate(page: params[:page], per_page: 2)
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

	def destroy
		@review.destroy
		redirect_to reviews_path
	end


	private

	def find_review
		@review = Review.friendly.find(params[:id])
	end
	def review_params
		params.require(:review).permit(:title, :content, :category, :link)
	end
end


