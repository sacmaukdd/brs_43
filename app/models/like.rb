class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review

  scope :load_with_id_user, -> review_id, user_id do
    where review_id: review_id, user_id: user_id
  end
end
