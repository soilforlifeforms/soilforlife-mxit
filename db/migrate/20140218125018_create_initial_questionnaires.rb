class CreateInitialQuestionnaires < ActiveRecord::Migration
  def change
    create_table :initial_questionnaires do |t|
      t.string :trainer
      t.string :group
      t.string :area
      t.string :basic_details_first_name
      t.string :basic_details_last_name
      t.string :basic_details_id_number
      t.string :basic_details_phone_number
      t.string :basic_details_home_address
      t.string :basic_details_garden_location
      t.string :basic_details_garden_location_qualitative
      t.string :basic_details_garden_size_qualitative_l
      t.string :basic_details_garden_size_qualitative_w
      t.string :basic_details_age
      t.string :basic_details_gender
      t.string :basic_details_marital_status
      t.string :basic_details_living_arrangements
      t.string :joining_details_referal
      t.string :joining_details_referal_qualitative
      t.string :joining_details_joining_reason
      t.string :joining_details_potential_growth
      t.string :education_levels
      t.string :education_levels_other
      t.string :employment
      t.string :full_time_employment
      t.string :part_time_employment
      t.string :casual_employment 
      t.string :other_employment
      t.string :other_employment_qualitative
      t.string :earning_power
      t.string :grant_recieved
      t.string :grant_recieved_qualitative
      t.string :grant_recieved_amount
      t.string :access_to_water 
      t.string :own_gardening_tools
      t.string :gardening_tools_spade
      t.string :gardening_tools_shovel
      t.string :gardening_tools_rake
      t.string :gardening_tools_other
      t.string :gardening_tools_other_qualitative
      t.string :other_organisations
      t.string :which_organisations
      t.string :help_recieved
      t.string :help_recieved_qualitative
      t.string :previous_exerience
      t.string :previous_experience_qualitative
      t.string :currently_growing
      t.string :currently_growing_qualitative_neg
      t.string :has_trainee_eaten_grown_veg
      t.string :has_trainee_sold_grown_veg
      t.string :profit_from_selling_veg
      t.string :has_trainee_swapped_grown_veg
      t.string :has_trainee_shared_grown_veg
      t.string :has_trainee_given_grown_veg_to_soup_kitchen
      t.string :has_trainee_made_jams_and_chutney
      t.string :has_trainee_other_grown_veg
      t.string :has_trainee_other_grown_veg_qualitative
      t.string :is_veg_bought_at_grocery_store_or_market
      t.string :is_veg_bought_at_stand_or_stall 
      t.string :is_veg_bought_at_tuck_shop
      t.string :is_veg_bought_from_friends_or_neighbours
      t.string :is_veg_bought_from_other
      t.string :is_veg_bought_from_other_qualitative
      t.string :money_spent_on_veg
      t.string :food_intake
      t.string :veg_intake
      t.string :general_health
      t.string :health_problems_diabetes
      t.string :health_problems_cancer
      t.string :health_problems_arthritis
      t.string :health_problems_tb
      t.string :health_problems_other
      t.string :health_problems_other_qualitative
      t.string :anything_else_to_add
      t.string :notes_from_the_trainer
      t.string :done
     
      t.timestamps
    end
  end
end
