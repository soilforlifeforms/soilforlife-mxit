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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140219104801) do

  create_table "final_questionnaires", :force => true do |t|
    t.string   "overall_training_impression"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "initial_questionnaires", :force => true do |t|
    t.string   "trainer"
    t.string   "group"
    t.string   "area"
    t.string   "trainee_first_name"
    t.string   "trainee_last_name"
    t.string   "trainee_id_number"
    t.string   "trainee_phone_number"
    t.string   "home_address"
    t.string   "garden_location"
    t.string   "garden_location_qualitative"
    t.string   "age"
    t.string   "gender"
    t.string   "marital_status"
    t.string   "people_living_in_house"
    t.string   "how_did_you_find_out"
    t.string   "how_did_you_find_out_other"
    t.string   "reason_for_joining"
    t.string   "perceptions_on_how_course_will_help_trainee"
    t.string   "education_levels"
    t.string   "education_levels_other"
    t.string   "employment"
    t.string   "full_time_employment"
    t.string   "part_time_employment"
    t.string   "casual_employment"
    t.string   "other_employment"
    t.string   "other_employment_qualitative"
    t.string   "earning_power"
    t.string   "grant_recieved"
    t.string   "grant_recieved_qualitative"
    t.string   "grant_recieved_amount"
    t.string   "access_to_water"
    t.string   "own_gardening_tools"
    t.string   "gardening_tools_spade"
    t.string   "gardening_tools_shovel"
    t.string   "gardening_tools_rake"
    t.string   "gardening_tools_other"
    t.string   "gardening_tools_other_qualitative"
    t.string   "other_organisations"
    t.string   "which_organisations"
    t.string   "help_recieved"
    t.string   "help_recieved_qualitative"
    t.string   "previous_exerience"
    t.string   "previous_experience_qualitative"
    t.string   "currently_growing"
    t.string   "currently_growing_qualitative_neg"
    t.string   "has_trainee_eaten_grown_veg"
    t.string   "has_trainee_sold_grown_veg"
    t.string   "profit_from_selling_veg"
    t.string   "has_trainee_swapped_grown_veg"
    t.string   "has_trainee_shared_grown_veg"
    t.string   "has_trainee_given_grown_veg_to_soup_kitchen"
    t.string   "has_trainee_made_jams_and_chutney"
    t.string   "has_trainee_other_grown_veg"
    t.string   "has_trainee_other_grown_veg_qualitative"
    t.string   "is_veg_bought_at_grocery_store_or_market"
    t.string   "is_veg_bought_at_stand_or_stall"
    t.string   "is_veg_bought_at_tuck_shop"
    t.string   "is_veg_bought_from_friends_or_neighbours"
    t.string   "is_veg_bought_from_other"
    t.string   "is_veg_bought_from_other_qualitative"
    t.string   "money_spent_on_veg"
    t.string   "food_intake"
    t.string   "veg_intake"
    t.string   "general_health"
    t.string   "health_problems_diabetes"
    t.string   "health_problems_cancer"
    t.string   "health_problems_arthritis"
    t.string   "health_problems_tb"
    t.string   "health_problems_other"
    t.string   "health_problems_other_qualitative"
    t.string   "anything_else_to_add"
    t.string   "notes_from_the_trainer"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.string   "mini_nursery"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
