# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170910201735) do

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "teaser"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
  end

  add_index "blogs", ["slug"], name: "index_blogs_on_slug", unique: true
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.boolean  "approved",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "preferred_contact"
    t.string   "message"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "purpose"
    t.boolean  "archived",          default: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "intakes", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "current_own",                                  default: false
    t.boolean  "current_rent",                                 default: false
    t.decimal  "current_monthly_pay", precision: 11, scale: 2
    t.string   "looking_for"
    t.string   "areas"
    t.string   "amenities"
    t.string   "price_range"
    t.integer  "bedrooms"
    t.string   "reason"
    t.string   "looking_time"
    t.boolean  "other_agent",                                  default: false
    t.string   "other_agent_name"
    t.boolean  "seen_liked",                                   default: false
    t.string   "seen_no_buy"
    t.string   "when_moved"
    t.string   "best_times"
    t.decimal  "price_min",           precision: 11, scale: 2
    t.decimal  "price_max",           precision: 11, scale: 2
    t.string   "buying_with"
    t.decimal  "downpayment",         precision: 11, scale: 2
    t.string   "source"
    t.string   "budget_monthly"
    t.boolean  "met_lender",                                   default: false
    t.boolean  "preapproved",                                  default: false
    t.decimal  "preapproved_amount",  precision: 11, scale: 2
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "intakes", ["user_id"], name: "index_intakes_on_user_id"

  create_table "listings", force: :cascade do |t|
    t.string   "zpid"
    t.string   "status"
    t.string   "location"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "address"
    t.string   "citystatezip"
    t.text     "notes"
    t.string   "slug"
    t.boolean  "featured",                   default: false
    t.string   "default_image_file_name"
    t.string   "default_image_content_type"
    t.integer  "default_image_file_size"
    t.datetime "default_image_updated_at"
  end

  add_index "listings", ["slug"], name: "index_listings_on_slug", unique: true

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context"
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id"
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type"
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.boolean  "buyer",                  default: false
    t.boolean  "seller",                 default: false
    t.boolean  "blog_emails",            default: false
    t.string   "preferred_contact"
    t.boolean  "status_confirmed",       default: false
    t.boolean  "archived",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "values", force: :cascade do |t|
    t.string   "address"
    t.string   "citystatezip"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "sell_timeframe"
    t.boolean  "archived",       default: false
  end

  add_index "values", ["user_id"], name: "index_values_on_user_id"

end
