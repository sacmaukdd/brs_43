# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161227033225) do

  create_table "activities", force: :cascade do |t|
    t.string   "action_name"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "created_at"], name: "index_activities_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.date     "publish_date"
    t.string   "image"
    t.string   "author"
    t.integer  "num_page"
    t.float    "rate"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["category_id", "created_at"], name: "index_books_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment_content"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id", "review_id", "created_at"], name: "index_comments_on_user_id_and_review_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_likes_on_review_id"
    t.index ["user_id", "review_id", "created_at"], name: "index_likes_on_user_id_and_review_id_and_created_at"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.float    "num_rate"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_rates_on_book_id"
    t.index ["user_id", "book_id", "created_at"], name: "index_rates_on_user_id_and_book_id_and_created_at"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "requests", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_requests_on_book_id"
    t.index ["user_id", "book_id", "created_at"], name: "index_requests_on_user_id_and_book_id_and_created_at"
    t.index ["user_id", "created_at"], name: "index_requests_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.string   "content_review"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id", "book_id", "created_at"], name: "index_reviews_on_user_id_and_book_id_and_created_at"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
