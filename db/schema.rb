# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_06_211648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "56A3C1A2-0531-49F3-8720-D7D4B1410E41_RU", id: false, force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "chain_id"
    t.string "chain_name"
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

  create_table "E342B777-64FD-4A49-9C9F-FEF4BA635863_EN", id: false, force: :cascade do |t|
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

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
