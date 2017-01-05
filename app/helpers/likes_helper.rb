module LikesHelper
  def like_toggle review_id, user_id, review_of_book
    if Like.load_with_id_user(review_id, user_id).any?
      render partial: "dislike", locals: {like_of_review: review_of_book}
    else
      render partial: "like", locals: {like_of_review: review_of_book}
    end
  end

  def load_to_detroy review_id, user_id
    Like.load_with_id_user(review_id, user_id).first
  end
end
