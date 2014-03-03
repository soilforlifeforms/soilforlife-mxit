<<<<<<< HEAD
class InitialQuestionnaireController < ApplicationController
  include MxitRails::Page 
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'TEST'
      end
    
      step :trainer do
        input :trainer, 'Trainer'
        validate :not_blank, 'you must submit something'
      end

      step :group do
        input :group, 'Group'
        validate :not_blank, 'you must submit something'
      end

           #could we have a  if params group exists in database no asking area?

      step :area do
        input :area, 'Area'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_first_name do
        input :basic_details_first_name, 'What is your first name?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_last_name do
        input :basic_details_last_name, 'What is your surname?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_id_number do
        input :basic_details_id_number, 'What is your ID number?'
        validate :not_blank, 'you must submit something'
     #   validate :sa_id_number, 'You must enter a valid South African ID number'
      end

      step :basic_details_phone_number do
        input :basic_details_phone_number, 'What is your phone number'
        validate :not_blank, 'you must submit something'
       # validate :cellphone_number, 'Please enter a South African Cell Phone number'
      end

      step :basic_details_home_address do
        input :basic_details_home_address, 'What is your home address?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_garden_location do
        select :basic_details_garden_location, 'Is your garden located at your home address?', {'Yes' => 'Yes', 'No' => 'No'}
      end
      
      step :basic_details_garden_location_qualitative do
         if params[:basic_details_garden_location] == 'Yes'
           skip_to :basic_details_garden_size_qualitative_l
           return
         end
        input :basic_details_garden_location_qualitative, 'What is your garden address?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_garden_size_qualitative_l do
        input :basic_details_garden_size_qualitative_l, 'what is the length of the garden?'
      end

      step :basic_details_garden_size_qualitative_w do
        input :basic_details_garden_size_qualitative_w, 'what is the width of the garden?'
      end


      step :basic_details_age do
        select :basic_details_age, 'Choose a category that includes your age?', {
          '< 18' => 'Under 18', 
          '18-14' => '18-24',
          '25-34' => '25-34',
          '35-44' => '35-44',
          '45-54' => '45-54',
          '55-64' => '55-65',
          '> 65' => '65 or Above',
          'N/A' => 'Prefer Not to Answer'
        }
      end

      step :basic_details_gender do
        select :gender, 'What is your gender?', {
          'male' => 'Male',
          'female' => 'Female'}
      end

      step :basic_details_marital_status do
        select :maritalStatus, 'what is your marital status?', {
          'single' => 'single', 
          'married' => 'married',
          'seperated' => 'seperated',
          'Living together like married partners' => 'Living together like married partners',
          'divorced' => 'divorced',
          'widowed' => 'widowed',
          'other' => 'other',
        }
      end

      step :basic_details_living_arrangements do
        input :joining_details_living_arrangements, 'How many people live in your household?'
        validate :numeric, 'please use a numeric value, for example 1 or 2.'
      end


      step :joining_details_referal do
        select :joining_details_referal, 'How did you find out about soil for life', {
          'Friend or neighbour' => 'Friend or neighbour', 
          'A Soil for Life Trainer' => 'A Soil for Life Trainer',
          'A Soil for Life Event' => 'A Soil for Life Event',
          'other' => 'other',
        }
      end


      step :joining_details_referal_qualitative do
          if params[:joining_details_referal] != 'other'
           skip_to :joining_details_joining_reason
           return
         end
        input :joining_details_referal_qualitative, 'So how exactly did you find out about Soil For Life?'
      end



      step :joining_details_joining_reason do
        input :joining_details_joining_reason, 'Why do you want to do the Home Food Garden Programme?'
      end

      step :joining_details_potential_growth do
        input :joining_details_potential_growth, 'How do you think this programme will help you?'
      end


       step :education_levels do
        select :education_levels, 'What is your highest level of education?', {
          'Dont know' => 'Dont know', 
          'N/A' => 'none',
          'grade 1-3' => 'Grade 1-3 (Sub A-Standard 1)',
          'grade 4-7' => 'Grade 4-7 (Standard 2-5)',
          'grade 8-9' => 'Grade 8-9 (Standard 6-7)',
          'grade 9-10' => 'Grade 9-10 (Standard 8-9)',
          'grade 10-11' => 'Grade 10-11 (Standard 9-10)',
          'Completed highschool' => 'Completed highschool',
          'Some Tertiary education' => 'Some Tertiary education',
          'Completed Teriary education' => 'Completed Teriary education',
          'Other' => 'Other'
        }
      end
   #Peram is set here for when people choose other.

      step :education_levels_other do
          if params[:education_levels] != 'Other' 
           skip_to :employment
           return
         end
        input :education_levels_other, 'So what are your education levels?'
      end

      step :employment do
        select :employment, 'Are you currently employed?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :full_time_employment do
        if params[:employment] == 'No' 
           skip_to :grant_recieved
           return
         end
        select :full_time_employment, 'Are you currently employed full time?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :part_time_employment do
        select :part_time_employmen, 'Are you currently employed part time?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end


      step :casual_employment do
        select :casual_employment, 'Are you currently employed casually?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end
      step :other_employment do
        select :other_employment, 'do you have another form of employment that has not been listed?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end


     step :other_employment_qualitative do
        if params[:other_employment] == 'No' 
           skip_to :earning_power
           return
         end
        input :other_employment_qualitative, 'What is your employment type?'
      end


      step :earning_power do
        select :earning_power, 'Gross total earned per month', {
          'None' => 'None', 
          'R1-R400' => 'R1-R400',
          'R401-R800' => 'R401-R800',
          'R801-R1600' => 'R801-R1600',
          'R1601-R3200' => 'R1601-R3200',
          'R3201-R6401' => 'R3201-R6401',
          'R6401-R12800' => 'R6401-R12800',
          '12800+' => '12800+',
          'N/A' => 'Prefer not to answer'
        }
      end

      step :grant_recieved do
        select :grant_recieved, 'Do you recieve a grant from the government?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :grant_recieved_qualitative do
        if params[:grant_recieved] == 'No'
           skip_to :access_to_water
           return
         end
         select :grant_recieved_qualitative, 'which grant do you recieve from the goverment?', {
          'Child mantaince'  => 'Child mantaince',
          'Disability' => 'Disability',
          'Old Age' => 'Old Age',
          'Other' => 'Other (such as care dependency, war veteran or grant in aid)',
         }
      end

      step :grant_recieved_amount do    
        select :grant_recieved_amount, 'How much in total do you recieve from your grant? ', {
          'None' => 'None', 
          'R1-R300' => 'R1-R300',
          'R301-R600' => 'R301-R600',
          'R601-R900' => 'R601-R900',
          'R901-R1200' => 'R901-R1200',
          'R1201-R1500' => 'R1201-R1500',
          'R1501+' => 'R1501+',
          'N/A' => 'Prefer not to answer'
        }
      end


      step :access_to_water do
        select :access_to_water, 'What is your access to water?', {
          'Piped (tap) water inside the dwelling' => 'Piped (tap) water inside the dwelling', 
          'Piped (tap) water inside the yard' => 'Piped (tap) water inside the yard',
          'Piped (tap) water on community stand: Distance less than 200 meters from dwelling' => 'Piped (tap) water on community stand: Distance less than 200 meters from dwelling',
          'Piped (tap) water on community stand: Distance between 200 meters and 500 meters from dwelling' => 'Piped (tap) water on community stand: Distance between 200 meters and 500 meters from dwelling',
          'Piped (tap) water on community stand: Distance between 500 meters and 1000 meters (1km) from dwelling' => 'Piped (tap) water on community stand: Distance between 500 meters and 1000 meters (1km) from dwelling',
          'Piped (tap) water on community stand: Distance more than 1000m (1km) from dwelling' => 'Piped (tap) water on community stand: Distance more than 1000m (1km) from dwelling',
          'No access to piped water' => 'No access to piped water',
          }
        end

      step :own_gardening_tools do
        select :own_gardening_tools , 'Do you have your own gardening tools?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end
# Peram set to skip next question if answered no to above.

        step :gardening_tools_spade do
           if params[:own_gardening_tools] == 'No'
           skip_to :other_organisations
           return
         end
        select :gardening_tools_spade , 'Do you have a spade?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        step :gardening_tools_shovel do
         select :gardening_tools_shovel , 'Do you have a shovel?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        step :gardening_tools_rake do
         select :gardening_tools_rake , 'Do you have a rake?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        step :gardening_tools_other do
         select :gardening_tools_other , 'Do you have any other gardening tools?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end


      step :gardening_tools_other_qualitative do
        if params[:gardening_tools_other] == 'No'
           skip_to :other_organisations
           return
         end
        input :gardening_tools_other_qualitative, 'What other gardening tools do you have?'
        validate :not_blank, 'you must submit something'
      end

        step :other_organisations do
        select :other_organisations , 'Have you applied to any other organisations for help in this garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

# Peram set to skip next question if answered no to above.
      step :which_organisations do
        if params[:other_organisations] == 'No'
           skip_to :help_recieved
           return
         end
        input :which_organisations, 'Which other organisations have you applied to?'
        validate :not_blank, 'you must submit something'
      end

      step :help_recieved do
        select :help_recieved, 'Have you received any help in the past year for this garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end


# Peram set to skip next question if answered no to above.   
      step :help_recieved_qualitative do
         if params[:help_recieved] == 'No'
           skip_to :previous_exerience
           return
         end
        input :help_recieved_qualitative, 'Who have you recieved help from?'
        validate :not_blank, 'you must submit something'
      end

      step :previous_exerience do
        select :previous_exerience , 'Do you have any previous experience gardening?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
         end

      step :previous_experience_qualitative do
         if params[:previous_exerience] == 'No'
           skip_to :is_veg_bought_at_grocery_store_or_market
           return
         end
        input :previous_experience_qualitative, 'What previous experience do you have?'
        validate :not_blank, 'you must submit something'
       end


      step :currently_growing do
         select :currently_growing , 'Are you currently growing your own vegetables?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :currently_growing_qualitative_neg do
        if params[:currently_growing] == 'Yes'
           skip_to :has_trainee_eaten_grown_veg
           return
         end
        input :currently_growing_qualitative_neg, 'Why are you not currently growing?'
        validate :not_blank, 'you must submit something'
      end

      step :has_trainee_eaten_grown_veg do
        if params[:currently_growing] == 'No'
           skip_to :is_veg_bought_at_grocery_store_or_market
           return
         end
        select :has_trainee_eaten_grown_veg, 'Have you been eating vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_sold_grown_veg do
        select :has_trainee_sold_grown_veg, 'Have you been selling vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :profit_from_selling_veg do
        if params[:has_trainee_sold_grown_veg] == 'No'
           skip_to :has_trainee_swapped_grown_veg
           return
         end
        select :profit_from_selling_veg, 'How much have you been making on average per week by selling your vegetables?', {
          'R1-50' => 'R1-50', 
          'R51-R100' => 'R51-R100',
          'R151-R200' => 'R201+',
          'N/A' => 'Rather not say',
        }
        end

      step :has_trainee_swapped_grown_veg do
        select :has_trainee_sold_grown_veg, 'Have you been swapping vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :has_trainee_shared_grown_veg do
        select :has_trainee_shared_grown_veg, 'Have you been sharing vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_given_grown_veg_to_soup_kitchen do
        select :has_trainee_given_grown_veg_to_soup_kitchen, 'Have you been giving vegetables that you have grown over the past year to a soup kitchen? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :has_trainee_made_jams_and_chutney do
        select :has_trainee_made_jams_and_chutney, 'Have you been making jams and chutneys from the vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_other_grown_veg do
        select :has_trainee_other_grown_veg, 'Have you been doing anything else from the vegetables you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_other_grown_veg_qualitative do
        if params[:has_trainee_other_grown_veg] == 'No'
           skip_to :is_veg_bought_at_grocery_store_or_market
           return
         end
        input :has_trainee_other_grown_veg_qualitative, 'What else have you been doing with your grown vegetables?'
        validate :not_blank, 'you must submit something'
      end

      step :is_veg_bought_at_grocery_store_or_market do
        select :is_veg_bought_at_grocery_store_or_market, 'when you buy vegetables, do you usualy buy them from a grocery store or market ?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

        step :is_veg_bought_at_stand_or_stall do
         select :is_veg_bought_at_stand_or_stall, 'when you buy vegetables, do you usualy buy them from a stand or stall?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

        step :is_veg_bought_at_tuck_shop do
         select :is_veg_bought_at_tuck_shop, 'when you buy vegetables, do you usualy buy them from a tuck shop?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

        step :is_veg_bought_from_friends_or_neighbours do
         select :is_veg_bought_from_friends_or_neighbours, 'when you buy vegetables, do you usualy buy them from friends or neighbours?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :is_veg_bought_from_other do
         select :is_veg_bought_from_other, 'when you buy vegetables, do you usualy buy them from another place?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :is_veg_bought_from_other_qualitative do
        if params[:is_veg_bought_from_other] == 'No'
           skip_to :money_spent_on_veg
           return
         end
        input :is_veg_bought_from_other_qualitative, 'Where else do you buy vegetables from?'
        validate :not_blank, 'you must submit something'
      end

      step :money_spent_on_veg do
        select :money_spent_on_veg, 'How much money did you spend on vegetables in the last month?', {
          'Dont know' => 'Dont know', 
          'R1-R50' => 'R1-R50',
          'R51-R100' => 'R51-R100',
          'R101-R150' => 'R101-R150',
          'R151-R200' => 'R151-R200', 
          'R201-R250' => 'R201-R250',
          'R251-R300' => 'R251-R300',
          'R301-R350' => 'R301-R350',
          'R351-R400' => 'RR351-R400',
          'R401+' => 'R401+',
          'N/A' => 'rather not say',
        }
        end

      step :food_intake do
        select :food_intake, 'How many meals do you eat in one day?', {
          'Dont know' => 'Dont know', 
          'One' => 'One',
          'Two' => 'Two',
          'Three' => 'Three',
          'Four' => 'Four', 
          'Five' => 'Five',
          'Six' => 'Six',
          'Six+' => 'Six+',
        }
        end

# Vegintake would be cool to validate with FoodIntake so that they can't place in higher VegIntake than FoodIntake
      step :veg_intake do
        select :veg_intake, 'How many meals do you eat in one day?', {
          'Dont know' => 'Dont know', 
          'one' => 'one',
          'two' => 'two',
          'three' => 'three',
          'four' => 'four', 
          'five' => 'five',
          'six' => 'six',
          'six+' => 'six+',
        }
        end

      step :general_health do
        select :general_health, 'In general, how would you say your health is?', {
          'Excellent' => 'Excellent', 
          'Very Good' => 'Very Good',
          'Good' => 'Good',
          'Fair' => 'Fair',
          'Poor' => 'Poor', 
          'Very poor' => 'Very poor',
        }
        end

      step :health_problems_diabetes do
        select :health_problems_diabetes, 'Do you have diabetes?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end



      step :health_problems_cancer do
        select :health_problems_cancer, 'Do you have cancer?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_arthritis do
        select :health_problems_arthritis, 'Do you have arthritis?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_tb do
        select :health_problems_tb, 'Do you have TB?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_other do
        select :health_problems_other, 'Do you have any other serious health conditions?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :health_problems_other_qualitative do
        if params[:health_problems_other] == 'No'
           skip_to :anything_else_to_add
           return
         end
        input :health_problems_other_qualitative, 'What other health problems do you have?'
        validate :not_blank, 'you must submit something'
      end

       step :anything_else_to_add do
          input :anything_else_to_add, 'is there anything else you would like to share with us about gardening?'
      end

        step :notes_from_the_trainer do
          input :notes_from_the_trainer, 'is there anything else you, as the trainer, would like to note?'
        end
=begin
      # We would like to have an option for the trainer to take a picture with his/her phone of the trainee, the trainee's ID
      # And a picture of their garden. So three picture things here, if Mxit can handle..

      step :notes_from_the_trainer do
          input :notes_from_the_trainer, 'is there anything else you, as the trainer, would like to note?'
        end
=end

      step :done do 
        proceed 'Submit my information'
        @trainer = params[:trainer]
        @group = params[:group]
        @area = params[:area]
        @gender = params[:gender]
      end
      
      submit do
        item = InitialQuestionnaire.new
        item.trainer = params[:trainer]
        item.group = params[:group]
        item.area = params[:area]
        item.basic_details_first_name = params[:basic_details_first_name]
        item.basic_details_last_name =  params[:basic_details_last_name]
        item.basic_details_id_number = params[:basic_details_id_number]
        item.basic_details_phone_number = params[:trainee_phone_number]
        item.basic_details_home_address = params[:home_address]
        item.basic_details_garden_location = params[:garden_location]
        item.basic_details_garden_location_qualitative = params[:basic_details_garden_location_qualitative]
        item.basic_details_garden_size_qualitative_l = params[:basic_details_garden_size_qualitative_l]
        item.basic_details_garden_size_qualitative_w = params[:basic_details_garden_size_qualitative_w]
        item.basic_details_age = params[:basic_details_age]
        item.basic_details_gender = params[:basic_details_gender]
        item.basic_details_marital_status = params[:basic_details_marital_status]
        item.basic_details_living_arrangements = params[:basic_details_living_arrangements]
        item.joining_details_referal = params[:joining_details_referal]
        item.joining_details_referal_qualitative = params[:joining_details_referal_qualitative]
        item.joining_details_joining_reason = params[:joining_details_joining_reason]
        item.joining_details_potential_growth = params[:joining_details_potential_growth]
        itemeducation_levels = params[:education_levels]
        item.education_levels_other = params[:education_levels_other]
        item.employment = params[:employment]
        item.full_time_employment = params[:full_time_employment]
        item.part_time_employment = params[:part_time_employment]
        item.casual_employment  = params[:casual_employment]
        item.other_employment = params[:other_employment]
        item.other_employment_qualitative = params[:other_employment_qualitative]
        item.earning_power = params[:earning_power]
        item.grant_recieved = params[:grant_recieved]
        item.grant_recieved_qualitative = params[:grant_recieved_qualitative]
        item.grant_recieved_amount = params[:grant_recieved_amount]
        item.access_to_water  = params[:access_to_water ]
        item.own_gardening_tools = params[:own_gardening_tools]
        item.gardening_tools_spade = params[:gardening_tools_spade]
        item.gardening_tools_shovel = params[:gardening_tools_shovel]
        item.gardening_tools_rake = params[:gardening_tools_rake]
        item.gardening_tools_other = params[:gardening_tools_other]
        item.gardening_tools_other_qualitative = params[:gardening_tools_other_qualitative]
        item.other_organisations = params[:other_organisations]
        item.which_organisations = params[:which_organisations]
        item.help_recieved = params[:help_recieved]
        item.help_recieved_qualitative = params[:help_recieved_qualitative]
        item.previous_exerience = params[:previous_exerience]
        item.previous_experience_qualitative = params[:previous_experience_qualitative]
        item.currently_growing = params[:currently_growing]
        item.currently_growing_qualitative_neg = params[:currently_growing_qualitative_neg]
        item.has_trainee_eaten_grown_veg = params[:has_trainee_eaten_grown_veg]
        item.has_trainee_sold_grown_veg = params[:has_trainee_sold_grown_veg]
        item.profit_from_selling_veg = params[:profit_from_selling_veg]
        item.has_trainee_swapped_grown_veg = params[:has_trainee_swapped_grown_veg]
        item.has_trainee_shared_grown_veg = params[:has_trainee_shared_grown_veg]
        item.has_trainee_given_grown_veg_to_soup_kitchen = params[:has_trainee_given_grown_veg_to_soup_kitchenhas_trainee_made_jams_and_chutney]
        item.has_trainee_made_jams_and_chutney = params[:has_trainee_made_jams_and_chutney]
        item.has_trainee_other_grown_veg = params[:has_trainee_other_grown_veg]
        item.has_trainee_other_grown_veg_qualitative = params[:has_trainee_other_grown_veg_qualitative]
        item.is_veg_bought_at_grocery_store_or_market = params[:is_veg_bought_at_grocery_store_or_market]
        item.is_veg_bought_at_stand_or_stall  = params[:is_veg_bought_at_stand_or_stall ]
        item.is_veg_bought_at_tuck_shop = params[:is_veg_bought_at_tuck_shop]
        item.is_veg_bought_from_friends_or_neighbours = params[:is_veg_bought_from_friends_or_neighbours]
        item.is_veg_bought_from_other = params[:is_veg_bought_from_other]
        item.is_veg_bought_from_other_qualitative = params[:is_veg_bought_from_other_qualitative]
        item.money_spent_on_veg = params[:money_spent_on_veg]
        item.food_intake = params[:food_intake]
        item.veg_intake = params[:veg_intake]
        item.general_health = params[:general_health]
        item.health_problems_diabetes = params[:health_problems_diabetes]
        item.health_problems_cancer = params[:health_problems_cancer]
        item.health_problems_arthritis = params[:health_problems_arthritis]
        item.health_problems_tb = params[:health_problems_tb]
        item.health_problems_other = params[:health_problems_other]
        item.health_problems_other_qualitative = params[:health_problems_other_qualitative]
        item.anything_else_to_add = params[:anything_else_to_add]
        item.notes_from_the_trainer = params[:notes_from_the_trainer]
        item.save!

        redirect_to '/initial'
      end
    end
  end
end
=======
class InitialQuestionnaireController < ApplicationController
  include MxitRails::Page 
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'TEST'
      end
    
      step :trainer do
        input :trainer, 'Trainer'
        validate :not_blank, 'you must submit something'
      end

      step :group do
        input :group, 'Group'
        validate :not_blank, 'you must submit something'
      end

           #could we have a  if params group exists in database no asking area?

      step :area do
        input :area, 'Area'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_first_name do
        input :basic_details_first_name, 'What is your first name?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_last_name do
        input :basic_details_last_name, 'What is your surname?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_id_number do
        input :basic_details_id_number, 'What is your ID number?'
        validate :not_blank, 'you must submit something'
     #   validate :sa_id_number, 'You must enter a valid South African ID number'
      end

      step :basic_details_phone_number do
        input :basic_details_phone_number, 'What is your phone number'
        validate :not_blank, 'you must submit something'
       # validate :cellphone_number, 'Please enter a South African Cell Phone number'
      end

      step :basic_details_home_address do
        input :basic_details_home_address, 'What is your home address?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_garden_location do
        select :basic_details_garden_location, 'Is your garden located at your home address?', {'Yes' => 'Yes', 'No' => 'No'}
      end
      
      step :basic_details_garden_location_qualitative do
         if params[:basic_details_garden_location] == 'Yes'
           skip_to :basic_details_garden_size_qualitative_l
           return
         end
        input :basic_details_garden_location_qualitative, 'What is your garden address?'
        validate :not_blank, 'you must submit something'
      end

      step :basic_details_garden_size_qualitative_l do
        input :basic_details_garden_size_qualitative_l, 'what is the length of the garden?'
      end

      step :basic_details_garden_size_qualitative_w do
        input :basic_details_garden_size_qualitative_w, 'what is the width of the garden?'
      end


      step :basic_details_age do
        select :basic_details_age, 'Choose a category that includes your age?', {
          '< 18' => 'Under 18', 
          '18-14' => '18-24',
          '25-34' => '25-34',
          '35-44' => '35-44',
          '45-54' => '45-54',
          '55-64' => '55-65',
          '> 65' => '65 or Above',
          'N/A' => 'Prefer Not to Answer'
        }
      end

      step :basic_details_gender do
        select :gender, 'What is your gender?', {
          'male' => 'Male',
          'female' => 'Female'}
      end

      step :basic_details_marital_status do
        select :maritalStatus, 'what is your marital status?', {
          'single' => 'single', 
          'married' => 'married',
          'seperated' => 'seperated',
          'Living together like married partners' => 'Living together like married partners',
          'divorced' => 'divorced',
          'widowed' => 'widowed',
          'other' => 'other',
        }
      end

      step :basic_details_living_arrangements do
        input :joining_details_living_arrangements, 'How many people live in your household?'
        validate :numeric, 'please use a numeric value, for example 1 or 2.'
      end


      step :joining_details_referal do
        select :joining_details_referal, 'How did you find out about soil for life', {
          'Friend or neighbour' => 'Friend or neighbour', 
          'A Soil for Life Trainer' => 'A Soil for Life Trainer',
          'A Soil for Life Event' => 'A Soil for Life Event',
          'other' => 'other',
        }
      end


      step :joining_details_referal_qualitative do
          if params[:joining_details_referal] != 'other'
           skip_to :joining_details_joining_reason
           return
         end
        input :joining_details_referal_qualitative, 'So how exactly did you find out about Soil For Life?'
      end



      step :joining_details_joining_reason do
        input :joining_details_joining_reason, 'Why do you want to do the Home Food Garden Programme?'
      end

      step :joining_details_potential_growth do
        input :joining_details_potential_growth, 'How do you think this programme will help you?'
      end


       step :education_levels do
        select :education_levels, 'What is your highest level of education?', {
          'Dont know' => 'Dont know', 
          'N/A' => 'none',
          'grade 1-3' => 'Grade 1-3 (Sub A-Standard 1)',
          'grade 4-7' => 'Grade 4-7 (Standard 2-5)',
          'grade 8-9' => 'Grade 8-9 (Standard 6-7)',
          'grade 9-10' => 'Grade 9-10 (Standard 8-9)',
          'grade 10-11' => 'Grade 10-11 (Standard 9-10)',
          'Completed highschool' => 'Completed highschool',
          'Some Tertiary education' => 'Some Tertiary education',
          'Completed Teriary education' => 'Completed Teriary education',
          'Other' => 'Other'
        }
      end
   #Peram is set here for when people choose other.

      step :education_levels_other do
          if params[:education_levels] != 'Other' 
           skip_to :employment
           return
         end
        input :education_levels_other, 'So what are your education levels?'
      end

      step :employment do
        select :employment, 'Are you currently employed?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :full_time_employment do
        if params[:employment] == 'No' 
           skip_to :grant_recieved
           return
         end
        select :full_time_employment, 'Are you currently employed full time?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :part_time_employment do
        select :part_time_employmen, 'Are you currently employed part time?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end


      step :casual_employment do
        select :casual_employment, 'Are you currently employed casually?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end
      step :other_employment do
        select :other_employment, 'do you have another form of employment that has not been listed?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end


     step :other_employment_qualitative do
        if params[:other_employment] == 'No' 
           skip_to :earning_power
           return
         end
        input :other_employment_qualitative, 'What is your employment type?'
      end


      step :earning_power do
        select :earning_power, 'Gross total earned per month', {
          'None' => 'None', 
          'R1-R400' => 'R1-R400',
          'R401-R800' => 'R401-R800',
          'R801-R1600' => 'R801-R1600',
          'R1601-R3200' => 'R1601-R3200',
          'R3201-R6401' => 'R3201-R6401',
          'R6401-R12800' => 'R6401-R12800',
          '12800+' => '12800+',
          'N/A' => 'Prefer not to answer'
        }
      end

      step :grant_recieved do
        select :grant_recieved, 'Do you recieve a grant from the government?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :grant_recieved_qualitative do
        if params[:grant_recieved] == 'No'
           skip_to :access_to_water
           return
         end
         select :grant_recieved_qualitative, 'which grant do you recieve from the goverment?', {
          'Child mantaince'  => 'Child mantaince',
          'Disability' => 'Disability',
          'Old Age' => 'Old Age',
          'Other' => 'Other (such as care dependency, war veteran or grant in aid)',
         }
      end

      step :grant_recieved_amount do    
        select :grant_recieved_amount, 'How much in total do you recieve from your grant? ', {
          'None' => 'None', 
          'R1-R300' => 'R1-R300',
          'R301-R600' => 'R301-R600',
          'R601-R900' => 'R601-R900',
          'R901-R1200' => 'R901-R1200',
          'R1201-R1500' => 'R1201-R1500',
          'R1501+' => 'R1501+',
          'N/A' => 'Prefer not to answer'
        }
      end


      step :access_to_water do
        select :access_to_water, 'What is your access to water?', {
          'Piped (tap) water inside the dwelling' => 'Piped (tap) water inside the dwelling', 
          'Piped (tap) water inside the yard' => 'Piped (tap) water inside the yard',
          'Piped (tap) water on community stand: Distance less than 200 meters from dwelling' => 'Piped (tap) water on community stand: Distance less than 200 meters from dwelling',
          'Piped (tap) water on community stand: Distance between 200 meters and 500 meters from dwelling' => 'Piped (tap) water on community stand: Distance between 200 meters and 500 meters from dwelling',
          'Piped (tap) water on community stand: Distance between 500 meters and 1000 meters (1km) from dwelling' => 'Piped (tap) water on community stand: Distance between 500 meters and 1000 meters (1km) from dwelling',
          'Piped (tap) water on community stand: Distance more than 1000m (1km) from dwelling' => 'Piped (tap) water on community stand: Distance more than 1000m (1km) from dwelling',
          'No access to piped water' => 'No access to piped water',
          }
        end

      step :own_gardening_tools do
        select :own_gardening_tools , 'Do you have your own gardening tools?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end
# Peram set to skip next question if answered no to above.

        step :gardening_tools_spade do
           if params[:own_gardening_tools] == 'No'
           skip_to :other_organisations
           return
         end
        select :gardening_tools_spade , 'Do you have a spade?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        step :gardening_tools_shovel do
         select :gardening_tools_shovel , 'Do you have a shovel?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        step :gardening_tools_rake do
         select :gardening_tools_rake , 'Do you have a rake?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        step :gardening_tools_other do
         select :gardening_tools_other , 'Do you have any other gardening tools?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end


      step :gardening_tools_other_qualitative do
        if params[:gardening_tools_other] == 'No'
           skip_to :other_organisations
           return
         end
        input :gardening_tools_other_qualitative, 'What other gardening tools do you have?'
        validate :not_blank, 'you must submit something'
      end

        step :other_organisations do
        select :other_organisations , 'Have you applied to any other organisations for help in this garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

# Peram set to skip next question if answered no to above.
      step :which_organisations do
        if params[:other_organisations] == 'No'
           skip_to :help_recieved
           return
         end
        input :which_organisations, 'Which other organisations have you applied to?'
        validate :not_blank, 'you must submit something'
      end

      step :help_recieved do
        select :help_recieved, 'Have you received any help in the past year for this garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end


# Peram set to skip next question if answered no to above.   
      step :help_recieved_qualitative do
         if params[:help_recieved] == 'No'
           skip_to :previous_exerience
           return
         end
        input :help_recieved_qualitative, 'Who have you recieved help from?'
        validate :not_blank, 'you must submit something'
      end

      step :previous_exerience do
        select :previous_exerience , 'Do you have any previous experience gardening?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
         end

      step :previous_experience_qualitative do
         if params[:previous_exerience] == 'No'
           skip_to :is_veg_bought_at_grocery_store_or_market
           return
         end
        input :previous_experience_qualitative, 'What previous experience do you have?'
        validate :not_blank, 'you must submit something'
       end


      step :currently_growing do
         select :currently_growing , 'Are you currently growing your own vegetables?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :currently_growing_qualitative_neg do
        if params[:currently_growing] == 'Yes'
           skip_to :has_trainee_eaten_grown_veg
           return
         end
        input :currently_growing_qualitative_neg, 'Why are you not currently growing?'
        validate :not_blank, 'you must submit something'
      end

      step :has_trainee_eaten_grown_veg do
        if params[:currently_growing] == 'No'
           skip_to :is_veg_bought_at_grocery_store_or_market
           return
         end
        select :has_trainee_eaten_grown_veg, 'Have you been eating vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_sold_grown_veg do
        select :has_trainee_sold_grown_veg, 'Have you been selling vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :profit_from_selling_veg do
        if params[:has_trainee_sold_grown_veg] == 'No'
           skip_to :has_trainee_swapped_grown_veg
           return
         end
        select :profit_from_selling_veg, 'How much have you been making on average per week by selling your vegetables?', {
          'R1-50' => 'R1-50', 
          'R51-R100' => 'R51-R100',
          'R151-R200' => 'R201+',
          'N/A' => 'Rather not say',
        }
        end

      step :has_trainee_swapped_grown_veg do
        select :has_trainee_sold_grown_veg, 'Have you been swapping vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :has_trainee_shared_grown_veg do
        select :has_trainee_shared_grown_veg, 'Have you been sharing vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_given_grown_veg_to_soup_kitchen do
        select :has_trainee_given_grown_veg_to_soup_kitchen, 'Have you been giving vegetables that you have grown over the past year to a soup kitchen? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :has_trainee_made_jams_and_chutney do
        select :has_trainee_made_jams_and_chutney, 'Have you been making jams and chutneys from the vegetables that you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_other_grown_veg do
        select :has_trainee_other_grown_veg, 'Have you been doing anything else from the vegetables you have grown over the past year? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :has_trainee_other_grown_veg_qualitative do
        if params[:has_trainee_other_grown_veg] == 'No'
           skip_to :is_veg_bought_at_grocery_store_or_market
           return
         end
        input :has_trainee_other_grown_veg_qualitative, 'What else have you been doing with your grown vegetables?'
        validate :not_blank, 'you must submit something'
      end

      step :is_veg_bought_at_grocery_store_or_market do
        select :is_veg_bought_at_grocery_store_or_market, 'when you buy vegetables, do you usualy buy them from a grocery store or market ?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

        step :is_veg_bought_at_stand_or_stall do
         select :is_veg_bought_at_stand_or_stall, 'when you buy vegetables, do you usualy buy them from a stand or stall?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

        step :is_veg_bought_at_tuck_shop do
         select :is_veg_bought_at_tuck_shop, 'when you buy vegetables, do you usualy buy them from a tuck shop?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

        step :is_veg_bought_from_friends_or_neighbours do
         select :is_veg_bought_from_friends_or_neighbours, 'when you buy vegetables, do you usualy buy them from friends or neighbours?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :is_veg_bought_from_other do
         select :is_veg_bought_from_other, 'when you buy vegetables, do you usualy buy them from another place?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :is_veg_bought_from_other_qualitative do
        if params[:is_veg_bought_from_other] == 'No'
           skip_to :money_spent_on_veg
           return
         end
        input :is_veg_bought_from_other_qualitative, 'Where else do you buy vegetables from?'
        validate :not_blank, 'you must submit something'
      end

      step :money_spent_on_veg do
        select :money_spent_on_veg, 'How much money did you spend on vegetables in the last month?', {
          'Dont know' => 'Dont know', 
          'R1-R50' => 'R1-R50',
          'R51-R100' => 'R51-R100',
          'R101-R150' => 'R101-R150',
          'R151-R200' => 'R151-R200', 
          'R201-R250' => 'R201-R250',
          'R251-R300' => 'R251-R300',
          'R301-R350' => 'R301-R350',
          'R351-R400' => 'RR351-R400',
          'R401+' => 'R401+',
          'N/A' => 'rather not say',
        }
        end

      step :food_intake do
        select :food_intake, 'How many meals do you eat in one day?', {
          'Dont know' => 'Dont know', 
          'One' => 'One',
          'Two' => 'Two',
          'Three' => 'Three',
          'Four' => 'Four', 
          'Five' => 'Five',
          'Six' => 'Six',
          'Six+' => 'Six+',
        }
        end

# Vegintake would be cool to validate with FoodIntake so that they can't place in higher VegIntake than FoodIntake
      step :veg_intake do
        select :veg_intake, 'How many meals do you eat in one day?', {
          'Dont know' => 'Dont know', 
          'one' => 'one',
          'two' => 'two',
          'three' => 'three',
          'four' => 'four', 
          'five' => 'five',
          'six' => 'six',
          'six+' => 'six+',
        }
        end

      step :general_health do
        select :general_health, 'In general, how would you say your health is?', {
          'Excellent' => 'Excellent', 
          'Very Good' => 'Very Good',
          'Good' => 'Good',
          'Fair' => 'Fair',
          'Poor' => 'Poor', 
          'Very poor' => 'Very poor',
        }
        end

      step :health_problems_diabetes do
        select :health_problems_diabetes, 'Do you have diabetes?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end



      step :health_problems_cancer do
        select :health_problems_cancer, 'Do you have cancer?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_arthritis do
        select :health_problems_arthritis, 'Do you have arthritis?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_tb do
        select :health_problems_tb, 'Do you have TB?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_other do
        select :health_problems_other, 'Do you have any other serious health conditions?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :health_problems_other_qualitative do
        if params[:health_problems_other] == 'No'
           skip_to :anything_else_to_add
           return
         end
        input :health_problems_other_qualitative, 'What other health problems do you have?'
        validate :not_blank, 'you must submit something'
      end

       step :anything_else_to_add do
          input :anything_else_to_add, 'is there anything else you would like to share with us about gardening?'
      end

        step :notes_from_the_trainer do
          input :notes_from_the_trainer, 'is there anything else you, as the trainer, would like to note?'
        end
=begin
      # We would like to have an option for the trainer to take a picture with his/her phone of the trainee, the trainee's ID
      # And a picture of their garden. So three picture things here, if Mxit can handle..

      step :notes_from_the_trainer do
          input :notes_from_the_trainer, 'is there anything else you, as the trainer, would like to note?'
        end
=end

      step :done do 
        proceed 'Submit my information'
        @trainer = params[:trainer]
        @group = params[:group]
        @area = params[:area]
        @gender = params[:gender]
      end
      
      submit do
        item = InitialQuestionnaire.new
        item.trainer = params[:trainer]
        item.group = params[:group]
        item.area = params[:area]
        item.basic_details_first_name = params[:basic_details_first_name]
        item.basic_details_last_name =  params[:basic_details_last_name]
        item.basic_details_id_number = params[:basic_details_id_number]
        item.basic_details_phone_number = params[:trainee_phone_number]
        item.basic_details_home_address = params[:home_address]
        item.basic_details_garden_location = params[:garden_location]
        item.basic_details_garden_location_qualitative = params[:basic_details_garden_location_qualitative]
        item.basic_details_garden_size_qualitative_l = params[:basic_details_garden_size_qualitative_l]
        item.basic_details_garden_size_qualitative_w = params[:basic_details_garden_size_qualitative_w]
        item.basic_details_age = params[:basic_details_age]
        item.basic_details_gender = params[:basic_details_gender]
        item.basic_details_marital_status = params[:basic_details_marital_status]
        item.basic_details_living_arrangements = params[:basic_details_living_arrangements]
        item.joining_details_referal = params[:joining_details_referal]
        item.joining_details_referal_qualitative = params[:joining_details_referal_qualitative]
        item.joining_details_joining_reason = params[:joining_details_joining_reason]
        item.joining_details_potential_growth = params[:joining_details_potential_growth]
        itemeducation_levels = params[:education_levels]
        item.education_levels_other = params[:education_levels_other]
        item.employment = params[:employment]
        item.full_time_employment = params[:full_time_employment]
        item.part_time_employment = params[:part_time_employment]
        item.casual_employment  = params[:casual_employment]
        item.other_employment = params[:other_employment]
        item.other_employment_qualitative = params[:other_employment_qualitative]
        item.earning_power = params[:earning_power]
        item.grant_recieved = params[:grant_recieved]
        item.grant_recieved_qualitative = params[:grant_recieved_qualitative]
        item.grant_recieved_amount = params[:grant_recieved_amount]
        item.access_to_water  = params[:access_to_water ]
        item.own_gardening_tools = params[:own_gardening_tools]
        item.gardening_tools_spade = params[:gardening_tools_spade]
        item.gardening_tools_shovel = params[:gardening_tools_shovel]
        item.gardening_tools_rake = params[:gardening_tools_rake]
        item.gardening_tools_other = params[:gardening_tools_other]
        item.gardening_tools_other_qualitative = params[:gardening_tools_other_qualitative]
        item.other_organisations = params[:other_organisations]
        item.which_organisations = params[:which_organisations]
        item.help_recieved = params[:help_recieved]
        item.help_recieved_qualitative = params[:help_recieved_qualitative]
        item.previous_exerience = params[:previous_exerience]
        item.previous_experience_qualitative = params[:previous_experience_qualitative]
        item.currently_growing = params[:currently_growing]
        item.currently_growing_qualitative_neg = params[:currently_growing_qualitative_neg]
        item.has_trainee_eaten_grown_veg = params[:has_trainee_eaten_grown_veg]
        item.has_trainee_sold_grown_veg = params[:has_trainee_sold_grown_veg]
        item.profit_from_selling_veg = params[:profit_from_selling_veg]
        item.has_trainee_swapped_grown_veg = params[:has_trainee_swapped_grown_veg]
        item.has_trainee_shared_grown_veg = params[:has_trainee_shared_grown_veg]
        item.has_trainee_given_grown_veg_to_soup_kitchen = params[:has_trainee_given_grown_veg_to_soup_kitchenhas_trainee_made_jams_and_chutney]
        item.has_trainee_made_jams_and_chutney = params[:has_trainee_made_jams_and_chutney]
        item.has_trainee_other_grown_veg = params[:has_trainee_other_grown_veg]
        item.has_trainee_other_grown_veg_qualitative = params[:has_trainee_other_grown_veg_qualitative]
        item.is_veg_bought_at_grocery_store_or_market = params[:is_veg_bought_at_grocery_store_or_market]
        item.is_veg_bought_at_stand_or_stall  = params[:is_veg_bought_at_stand_or_stall ]
        item.is_veg_bought_at_tuck_shop = params[:is_veg_bought_at_tuck_shop]
        item.is_veg_bought_from_friends_or_neighbours = params[:is_veg_bought_from_friends_or_neighbours]
        item.is_veg_bought_from_other = params[:is_veg_bought_from_other]
        item.is_veg_bought_from_other_qualitative = params[:is_veg_bought_from_other_qualitative]
        item.money_spent_on_veg = params[:money_spent_on_veg]
        item.food_intake = params[:food_intake]
        item.veg_intake = params[:veg_intake]
        item.general_health = params[:general_health]
        item.health_problems_diabetes = params[:health_problems_diabetes]
        item.health_problems_cancer = params[:health_problems_cancer]
        item.health_problems_arthritis = params[:health_problems_arthritis]
        item.health_problems_tb = params[:health_problems_tb]
        item.health_problems_other = params[:health_problems_other]
        item.health_problems_other_qualitative = params[:health_problems_other_qualitative]
        item.anything_else_to_add = params[:anything_else_to_add]
        item.notes_from_the_trainer = params[:notes_from_the_trainer]
        item.save!
        redirect_to '/initial'
      end
    end
  end
end
>>>>>>> a4cb7a4d1bf22d1487f4e47bf21d713360f06ae1

