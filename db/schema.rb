# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_102319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agoda_cores", id: false, force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "chain_id"
    t.text "chain_name"
    t.integer "brand_id"
    t.text "brand_name"
    t.text "hotel_name"
    t.text "hotel_formerly_name"
    t.text "hotel_translated_name"
    t.text "addressline1"
    t.text "addressline2"
    t.text "zipcode"
    t.text "city"
    t.text "state"
    t.text "country"
    t.text "countryisocode"
    t.integer "star_rating"
    t.float "longitude"
    t.float "latitude"
    t.text "url"
    t.text "checkin"
    t.text "checkout"
    t.integer "numberrooms"
    t.text "numberfloors"
    t.integer "yearopened"
    t.integer "yearrenovated"
    t.text "photo1"
    t.text "photo2"
    t.text "photo3"
    t.text "photo4"
    t.text "photo5"
    t.text "overview"
    t.integer "rates_from"
    t.integer "continent_id"
    t.text "continent_name"
    t.integer "city_id"
    t.integer "country_id"
    t.integer "number_of_reviews"
    t.float "rating_average"
    t.text "rates_currency"
  end

  create_table "brands", force: :cascade do |t|
    t.string "brand_name"
    t.string "agoda_brand_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.bigint "brand_id"
    t.string "name"
    t.text "overview"
    t.integer "star_rating"
    t.string "checkin"
    t.string "checkout"
    t.integer "number_rooms"
    t.integer "number_floors"
    t.integer "year_opened"
    t.integer "year_renovated"
    t.string "addressline1"
    t.string "zipcode"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "country_iso_code"
    t.float "longitude"
    t.float "latitude"
    t.string "continent_name"
    t.integer "agoda_hotel_id"
    t.integer "agoda_continent_id"
    t.integer "agoda_city_id"
    t.integer "agoda_country_id"
    t.string "agoda_url"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.string "slug"
    t.string "hotel_state", default: "draft"
    t.index ["agoda_hotel_id"], name: "index_hotels_on_agoda_hotel_id"
    t.index ["brand_id"], name: "index_hotels_on_brand_id"
    t.index ["id", "hotel_state"], name: "index_hotels_on_id_and_hotel_state"
    t.index ["name", "hotel_state"], name: "index_hotels_on_name_and_hotel_state"
    t.index ["name"], name: "index_hotels_on_name"
    t.index ["slug", "hotel_state"], name: "index_hotels_on_slug_and_hotel_state"
    t.index ["slug"], name: "index_hotels_on_slug", unique: true
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "affiliate_url"
    t.string "api_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "hotel_id"
    t.integer "partner_id"
    t.string "url"
    t.integer "order"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["hotel_id"], name: "index_photos_on_hotel_id"
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "hotel_id"
    t.integer "partner_id"
    t.string "roomtype_name"
    t.string "currency"
    t.float "daily_rate"
    t.date "actual_on"
    t.float "crossed_out_rate"
    t.float "discount_percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "star_rating"
    t.integer "review_count"
    t.float "review_score"
    t.index ["hotel_id"], name: "index_rates_on_hotel_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
