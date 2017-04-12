class ReviewsController < ApplicationController
  before_action :find_reviewable, only: [:index, :new, :update, :destroy, :create]

  def create
  	@review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @reviewable, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @contentable }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @review = Review.new
  end

  def update
  end

  def destroy
  end

  private

  def review_params
  	params.require(:review).permit(:reviewable_type, :reviewable_id, :content, :user_id)
  end

  def find_reviewable
  	@reviewable = nil
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @reviewable =  $1.classify.constantize.find(value)
      end
    end
  end
end
