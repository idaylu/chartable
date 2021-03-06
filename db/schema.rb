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

ActiveRecord::Schema.define(version: 20171020210648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debt_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debts", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "lender_id"
    t.integer "debt_type_id"
    t.float "max_amount"
    t.float "min_amount"
    t.integer "year_incurred"
    t.string "rate"
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gender_data", force: :cascade do |t|
    t.string "country"
    t.float "gender_inequality_index_2014"
    t.integer "gender_inequality_index_rank_2014"
    t.float "maternal_mortality_per_100k_2013"
    t.float "adolescent_birth_rate_per_1k"
    t.float "womens_share_of_seats_in_parliament_2014"
    t.float "share_of_women_w_some_secondary_education_25_and_up_2005_2014"
    t.float "share_of_men_w_some_secondary_education"
    t.float "women_labor_force_participation_rate_15_and_up_2013"
    t.float "men_labor_force_participation_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lenders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pk_armed_types", force: :cascade do |t|
    t.string "armed_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pk_cities", force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pk_classifications", force: :cascade do |t|
    t.string "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pk_deaths", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "age"
    t.string "street_address"
    t.string "law_enforcement_agency"
    t.integer "pk_race_id"
    t.integer "pk_sex_id"
    t.integer "pk_city_id"
    t.integer "pk_state_id"
    t.integer "pk_armed_type_id"
    t.integer "pk_classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pk_races", force: :cascade do |t|
    t.string "race"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "perc_of_us_pop"
    t.float "est_pop_2016"
  end

  create_table "pk_sexes", force: :cascade do |t|
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pk_states", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "perc_of_us_pop"
    t.integer "total_pop_2016"
  end

  create_table "races", force: :cascade do |t|
    t.string "race"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sexes", force: :cascade do |t|
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "race_id"
    t.integer "sex_id"
    t.integer "year_id"
    t.float "age_adjusted_death_rate"
    t.float "average_life_expectancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_years", force: :cascade do |t|
    t.integer "temp_year"
    t.float "winter_temperature_celsius"
    t.float "spring_temperature_celsius"
    t.float "summer_temperature_celsius"
    t.float "fall_temperature_celsius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visualizations", force: :cascade do |t|
    t.string "link"
    t.string "public_id"
    t.string "dataset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
