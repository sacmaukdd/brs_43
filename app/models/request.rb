class Request < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :order_date_desc, -> {order created_at: :desc}
  scope :have_request, -> user_id, book_id do
    where user_id: user_id, book_id: book_id
  end
end
