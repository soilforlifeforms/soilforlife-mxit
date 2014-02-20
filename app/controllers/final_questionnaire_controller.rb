class FinalQuestionnaireController < ApplicationController
  include MxitRails::Page
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do 
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'randomT'
      end

      step :trainer do
        input :trainer, 'Trainer'
      end

      step :group do
        input :group, 'Group'
      end

      step :trainee_id_number do
        input :trainee_id_number, 'What is your ID number?'
     #   validate :sa_id_number, 'You must enter a valid South African ID number'
      end

      step :change_of_address do
        select :change_of_address, 'have you changed adress since you started at Soil For Life?', {
         'Yes' => 'Yes',
         'No' => 'No',
        }
      end

      step :change_of_adresss_qualitative do 
        if params[:change_of_adresss] = 'No' 
           skip_to :change_of_maritial_status
           return
         end
        input :change_of_adresss_qualitative, 'What is your new address?'
      end

      step :change_of_maritial_status do
        select :change_of_maritial_status, 'Has your maritial status changed since you started at Soil For Life?', {
          'Yes' => 'Yes',
          'No'=> 'No',
        }
      end

      step :change_of_maritial_status_qualitative do 
        if params[:change_of_maritial_status] = 'No' 
           skip_to :change_of_living_arangements
           return
         end
        select :change_of_maritial_status_qualitative, "What is your new maritial stauts?", {
          'single' => 'single', 
          'married' => 'married',
          'seperated' => 'seperated',
          'Living together like married partners' => 'Living together like married partners',
          'divorced' => 'divorced',
          'widowed' => 'widowed',
          'other' => 'other',
        }
      end

      step :change_of_living_arangements do
        select :change_of_living_arangements, 'Has your living arangments (how many people live in your house) changed since you started at Soil For Life?', {
          'Yes' => 'Yes',
          'No'=> 'No',
        }
      end

      step :change_of_living_arangements_qualitative do 
        if params[:change_of_living_arangements] = 'No' 
           skip_to :change_of_employment
           return
         end
        input :change_of_living_arangements_qualitative, "How many people now live in your household?"
      end

           step :change_of_employment do
        select :change_of_employment, 'Has your employment status changed since you started at Soil For Life?', {
          'Yes' => 'Yes',
          'No'=> 'No',
        }
      end

          step :employment do
        if params[:change_of_employment] = 'No' 
           skip_to :understandable_training
           return
         end

        select :employment, 'Are you currently employed?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end


      step :full_time_employment do
        if params[:employment] == 'No' 
           skip_to :understandable_training
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

      

       step :understandable_training do
        select :understandable_training, 'The information presented was helpful', {
          'Strongly disagree' => 'Strongly disagree', 
          'Disagree' => 'Disagree',
          'No Opinion' => 'No Opinion',
          'Agree' => 'Agree',
          'Strongly Agree' => 'Strongly Agree',
        }
      end

       step :helpful_support_visits do
        select :helpful_support_visits, 'The follow-ups/support visits are helpful.', {
          'Strongly disagree' => 'Strongly disagree', 
          'Disagree' => 'Disagree',
          'No Opinion' => 'No Opinion',
          'Agree' => 'Agree',
          'Strongly Agree' => 'Strongly Agree',
        }
      end

      step :pros_about_training do
        input :pros_about_training, 'What was good about the training?'
      end

      step :improvements_about_training do
        input :improvements_about_training, 'What could be better about the training?'
      end

       step :what_was_learnt do
        input :what_was_learnt, 'What have you learnt from Soil for Life?'
      end

       step :what_was_learnt_NB do
        input :what_was_learnt_NB, 'What is the most important thing you have learnt?'
      end

      step :most_significant_change do
        input :most_significant_change, 'In the last year, what would you say is the most significant (biggest) change that has happened because of training with Soil for Life?'
      end

      step :most_significant_change_qualitative do
        input :most_significant_change_qualitative, 'why is this change significant?'
      end

      step :still_growing_fq do
         select :still_growing_fq , 'Since you finished the training are you still growing vegetables in your food garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

# It would be nice to only show WhyNotGrowing if trainer says no
      step :why_not_growing do
         if params[:still_growing_fq] == 'Yes' 
           skip_to :type_of_veg_garden_trench_bed
           return
         end
        input :why_not_growing, 'Why have you stopped growing vegetables?'
      end


      step :type_of_veg_garden_trench_bed do
        select :type_of_veg_garden_trench_bed, 'Do you have a trench-bed in your garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :type_of_veg_garden_trench_bed_amount do
        if params[:type_of_veg_garden_trench_bed] == 'No' 
           skip_to :type_of_veg_garden_eco_circle
           return
         end
        select :type_of_veg_garden_trench_bed_amount, 'How many trench beds do you have in your food garden?', {
          'one' => 'one',
          'two' => 'two',
          'three' => 'three',
          'four' => 'four', 
          'five' => 'five',
          'six' => 'six',
          'six+' => 'six+',
          }
        end
      

      step :type_of_veg_garden_tyre_garden do
        select :type_of_veg_garden_tyre_garden, 'Do you have a tyre garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :type_of_veg_garden_eco_circle do
        select :type_of_veg_garden_eco_circle, 'Do you have a eco circle in your garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :type_of_veg_garden_container_garden do
        select :type_of_veg_garden_eco_circle, 'Do you make use of container gardening?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :type_of_veg_garden_other do
        select :type_of_veg_garden_other, 'Do you have another type of veg garden that hasnt been mentioned?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end
      # Only show WhatOtherGardenSetup if other is chosen above

      step :type_of_veg_garden_other_qualitative do
         if params[:type_of_veg_garden_other_qualitative] == 'No' 
           skip_to :picking_veg
           return
         end
        input :type_of_veg_garden_other_qualitative, 'What other type of vegetable bed do you have in your food garden?'
      end

        step :picking_veg do
        select :picking_veg, 'How often do you pick vegetables from your garden to eat?', {
          'Everyday' => 'Everyday',
          'Once a week' => 'Once a week',
          '2 to 3 times a month' => '2 to 3 times a month',
          'Once a month' => 'Once a month', 
          'Less than once a month' => 'Less than once a month',
          'six' => 'six',
          'six+' => 'six+',
        }
      end


      step :currently_growing_fq do
        input :currently_growing_fq, 'What vegetables are you currently growing?'
       end

      step :still_buying do
        select :still_buying , 'Are you still buying vegetables? ', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end


      step :money_spent_on_veg_fq do
          if params[:still_buying] == 'No' 
          skip_to :has_trainee_sold_grown_veg
           return
         end
        select :money_spent_on_veg_fq, 'How much money did you spend on vegetables in the last month?', {
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
           skip_to :where_veg_is_bought
           return
         end
        input :has_trainee_other_grown_veg_qualitative, 'What else have you been doing with your grown vegetables?'
      end

      step :health_compaired_to_last_year do
        select :health_compaired_to_last_year, 'Compared to one year ago, how would you rate your health in general now?', {
          'Much better' => 'Much better now than one year ago', 
          'Somewhat better' => 'Somewhat better now than one year ago',
          'The same' => 'About the same',
          'Somewhat worse than one year ago' => 'Somewhat worse than one year ago',
          'Much worse than one year ago' => 'Much worse than one year ago',
        }
        end

         step :health_problems_diabetes do
        select :health_problems_diabetes, 'Do you have diabetes:', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

      step :health_problems_cancer do
        select :health_problems_cancer, 'Do you have cancer:', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_arthritis do
        select :health_problems_arthritis, 'Do you have arthritis:', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
      end

       step :health_problems_tb do
        select :health_problems_tb, 'Do you have arthritis:', {
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
        input :health_problems_other_qualitative, 'Where other health problems do you have?'
      end

      step :feeling_towards_gardening do
        input :feeling_towards_gardening, 'How does working in the garden make you feel?'
      end

        step :spreading_knowelage do
         select :spreading_knowelage , 'Have you helped someone else to make a food garden in the last year?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

         step :spreading_knowelage_qualitative_pro do
          if params[:spreading_knowelage] == 'No'
           skip_to :spreading_knowelage_qualitative_neg
           return
         end
        input :spreading_knowelage_qualitative_pro, 'Who did you help and how?'
      end

         step :spreading_knowelage_qualitative_neg do
        if params[:spreading_knowelage] == 'Yes'
           skip_to :future_gardening_plans
           return
         end
        input :spreading_knowelage_qualitative_neg, 'Why did you not help anyone else to create a garden?'
      end
      step :future_gardening_plans do
         select :future_gardening_plans , 'Now that the food garden programme has ended are you going to continue to grow food?', {
          'Yes' => 'Yes', 
          'No' => 'No',
          'only if' => 'only if....',
        }
        end

        step :needs_to_continue_gardening do
          if params[:future_gardening_plans] != 'Only if'
           skip_to :knowlage_of_life_skills
           return
         end
          input :needs_to_continue_gardening, 'What do you need to continue gardening?'
        end

        step :knowlage_of_life_skills do
         select :knowlage_of_life_skills , 'Do you know about the Soil for Life "Life Skills" programme?', {
          'yes' => 'yes', 
          'no' => 'no',
        }
        end

        step :enrollment_plan do
         select :enrollment_plan , 'Are you planning on enrolling in the "life Skills" programme? ', {
          'yes' => 'yes', 
          'no' => 'no',
        }
        end

        step :lifeskills_activity_recomendations do
          input :lifeskills_activity_recomendations, 'What sort of actives would you like to do in the Life Skills Programme?'
        end

         step :final_words_fq do
          input :final_words_fq, 'Is there anything else you would like to say about Soil for Life?'
        end

        #if possible, we would like to be able to take a picture of the  trainee and also their "after picture" of their garden.

        step :trainer_notes_fq do
          input :Trainer_notes_fq, 'Is there anything else you, as the trainer would like to note?'
        end

        step :overall_training_impression do
          select :overall_training_impression, 'Overall, I thought the training was very good', {
            'Strongly disagree' => 'Strongly disagree', 
           'Disagree' => 'Disagree',
           'No Opinion' => 'No Opinion',
            'Agree' => 'Agree',
            'Strongly Agree' => 'Strongly Agree'
        }
      end
      step :done do
        proceed 'Submit my information'
      end

      submit do
        item = FinalQuestionnaire.new
        item.overall_training_impression = params[:overall_training_impression]
        item.trainer = params [:trainer]
        item.group = params [:group]
        item.trainee_id_number = params [:trainee_id_number]
        item.change_of_address = params [:change_of_address]
        item.change_of_adresss_qualitative = params [:change_of_adresss_qualitative]
        item.change_of_maritial_status = params [:change_of_maritial_status]
        item.change_of_maritial_status_qualitative = params [:change_of_maritial_status_qualitative]
        item.change_of_living_arangements = params [:change_of_living_arangements]
        item.change_of_living_arangements_qualitative = params [:change_of_living_arangements_qualitative]
        item.change_of_employment = params [:change_of_employment]
        item.employment = params [:employment]
        item.full_time_employment = params [:full_time_employment]
        item.part_time_employment  = params [:part_time_employment]
        item.casual_employment = params [:casual_employment]
        item.other_employment = params [:other_employment]
        item.other_employment_qualitative = params [:other_employment_qualitative]
        item.understandable_training = params [:understandable_training]
        item.helpful_support_visits = params [:helpful_support_visits]
        item.pros_about_training = params [:pros_about_training]
        item.improvements_about_training = params [:improvements_about_training]
        item.what_was_learntwhat_was_learnt_NB = params [:what_was_learnt]
        item.what_was_learnt_NB = params [:what_was_learnt_NB]
        item.most_significant_change = params [:most_significant_change]
        item.most_significant_change_qualitativestill_growing_fq = params [:most_significant_change_qualitative]
        item.still_growing_fq = params [:still_growing_fq]
        item.why_not_growing = params [:why_not_growing]
        item.type_of_veg_garden_trench_bed = params [:type_of_veg_garden_trench_bed]
        item.type_of_veg_garden_trench_bed_amount = params [:type_of_veg_garden_trench_bed_amount]
        item.type_of_veg_garden_tyre_garden = params [:type_of_veg_garden_tyre_garden]
        item.type_of_veg_garden_eco_circle = params [:type_of_veg_garden_eco_circle]
        item.type_of_veg_garden_container_garden = params [:type_of_veg_garden_container_garden]
        item.type_of_veg_garden_other = params [:type_of_veg_garden_other]
        item.type_of_veg_garden_other_qualitative = params [:type_of_veg_garden_other_qualitative]
        item.picking_veg = params [:picking_veg]
        item.currently_growing_fq = params [:currently_growing_fq]
        item.still_buying = params [:still_buying]
        item.money_spent_on_veg_fq = params [:money_spent_on_veg_fq]
        item.has_trainee_sold_grown_veg = params [:has_trainee_sold_grown_veg]
        item.profit_from_selling_veg = params [:profit_from_selling_vegprofit_from_selling_veg]
        item.has_trainee_swapped_grown_veg = params [:has_trainee_swapped_grown_veg]
        item.has_trainee_shared_grown_veg = params [:has_trainee_shared_grown_veg]
        item.has_trainee_given_grown_veg_to_soup_kitchen = params [:has_trainee_given_grown_veg_to_soup_kitchen]
        item.has_trainee_made_jams_and_chutney = params [:has_trainee_made_jams_and_chutney]
        item.has_trainee_other_grown_veg  = params [:has_trainee_other_grown_veg]
        item.has_trainee_other_grown_veg_qualitative = params [:has_trainee_other_grown_veg_qualitative]
        item.health_compaired_to_last_year = params [:health_compaired_to_last_year]
        item.health_problems_diabetes = params [:health_problems_diabetes]
        item.health_problems_cancer = params [:health_problems_cancer]
        item.health_problems_arthritis = params [:health_problems_arthritis]
        item.health_problems_tb = params [:health_problems_tb]
        item.health_problems_other = params [:health_problems_other]
        item.health_problems_other_qualitative = params [:health_problems_other_qualitative]
        item.feeling_towards_gardening = params [:feeling_towards_gardening]
        item.spreading_knowelage = params [:spreading_knowelage]
        item.spreading_knowelage_qualitative_pro = params [:spreading_knowelage_qualitative_pro]
        items.preading_knowelage_qualitative_neg. = params [:spreading_knowelage_qualitative_neg]
        item.future_gardening_plans = params [:future_gardening_plans]
        item.needs_to_continue_gardening = params [:needs_to_continue_gardening]
        item.knowlage_of_life_skills = params [:knowlage_of_life_skills]
        item.enrollment_plan = params [:enrollment_plan]
        item.lifeskills_activity_recomendations  = params [:lifeskills_activity_recomendations ]
        item.final_words_fq = params [:final_words_fq]
        item.trainer_notes_fq  = params [:trainer_notes_fq ]
        item.overall_training_impression = params [:overall_training_impression]
      
        item.save!

        redirect_to '/final'
end
  end
    end
      end
