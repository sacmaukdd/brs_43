class LikesController < ApplicationController
  def create
    @like = current_user.likes.build like_params
    if @like.save
      @review = Review.find_by id: @like.review_id
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "like_error"
      redirect_to root_url
    end

  end

  def destroy
    @like = Like.find_by id: params[:id]
    if @like
      @review = Review.find_by id: @like.review_id
      if @like.destroy
        respond_to do |format|
          format.js
        end
      else
        flash[:danger] = t "dislike_error"
        redirect_to request.referrer
      end
    else
      flash[:danger] = t "error_load_like"
      redirect_to request.referrer
    end
  end

  private
  def like_params
    params.require(:like).permit :review_id
  end
end
