class CommentsController < ApplicationController
  before_action :load_review, only: :show
  before_action :load_comment, except: [:new, :create]
  before_action :load_category, only: [:show, :edit, :update]

  def create
    @comment = current_user.comments.build comment_params
    @review = Review.find_by id: @comment.review_id
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "comment_not_create"
      redirect_to request.referrer
    end
  end

  def edit
  end

  def update
    @review = Review.find_by id: @comment.review_id
    unless @review
      flash[:success] = t "review_not_found"
      redirect_to :back
    end
    if @comment.update_attributes comment_params
      flash[:success] = t "comment_update"
    else
      flash[:danger] = t "comment_not_update"
    end
      redirect_to book_path @review.book_id
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "deleted"
    else
      flash[:danger] = t "comment_not_delete"
    end
      redirect_to request.referrer
  end

  private
  def comment_params
    params.require(:comment).permit :comment_content, :review_id
  end

  def load_review
    @review = Review.find_by id: params[:id]
    unless @review
      flash[:danger] = t "review_not_found"
      redirect_to request.referrer
    end
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    unless @comment
      flash[:danger] = t "comment_not_found"
      redirect_to request.referrer
    end
  end

  def load_category
    @categories = Category.all
    unless @categories
      flash[:danger] = t "category_not_found"
      redirect_to request.referrer
    end
  end
end
