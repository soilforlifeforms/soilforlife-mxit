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

      step :trainee_first_name do
        input :trainee_first_name, 'What is your first name?'
      end

      step :trainee_last_name do
        input :trainee_last_name, 'What is your surname?'
      end

      step :trainee_id_number do
        input :trainee_id_number, 'What is your ID number?'
     #   validate :sa_id_number, 'You must enter a valid South African ID number'
      end

      step :change_of_adresss do
        select :change_of_adresss, 'have you changed adress since you started at Soil For Life?'
          'Yes' => 'Yes'
          'No'=> 'No'

      step :change_of_adresss_qualitative do 
        if params[:change_of_adresss] = 'No' 
           skip_to :change_of_maritial_status
           return
         end
        input :change_of_adresss_qualitative, "What is your new address?"

      step :change_of_maritial_status do
        select :change_of_maritial_status, 'Has your maritial status changed since you started at Soil For Life?'
          'Yes' => 'Yes'
          'No'=> 'No' 

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
        select :change_of_living_arangements, 'Has your living arangments (how many people live in your house) changed since you started at Soil For Life?'
          'Yes' => 'Yes'
          'No'=> 'No' 

      step :change_of_living_arangements_qualitative do 
        if params[:change_of_living_arangements] = 'No' 
           skip_to :change_of_employment
           return
         end
        input :change_of_living_arangements_qualitative, "How many people now live in your household?"

           step :change_of_employment do
        select :change_of_employment, 'Has your employment status changed since you started at Soil For Life?'
          'Yes' => 'Yes'
          'No'=> 'No' 

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
          'Strongly Agree' => 'Strongly Agree'
        }
      end

       step :helpful_support_visits do
        select :helpful_support_visits, 'The follow-ups/support visits are helpful.', {
          'Strongly disagree' => 'Strongly disagree', 
          'Disagree' => 'Disagree',
          'No Opinion' => 'No Opinion',
          'Agree' => 'Agree',
          'Strongly Agree' => 'Strongly Agree'
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
      step :WhyNotGrowing do
         if params[:still_growing_fq] == 'Yes' 
           skip_to :type_of_veg_garden_trench_bed
           return
         end
        input :WhyNotGrowing, 'Why have you stopped growing vegetables?'
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
        select :type_of_veg_garden_tyre_garden 'Do you have a trench-bed in your garden?', {
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
        input :WhatCurrentlyGrowingFQ, 'What vegetables are you currently growing?', {
        end

          #Again if you think we should shorten this one we can look at a way of doing that. also would need to be multi select.

           step :StillBuying do
           select :StillBuying , 'Are you still buying vegetables? ', {
           'yes' => 'yes', 
           'no' => 'no',
        end

        #Question that would require grabing information from DB: Are you still spending around XXXXXX per week?


      step :WhatHasTraineeDoneWithGrownVegitablesFQ do
        select :WhatHasTraineeDoneWithGrownVegitablesFQ, 'What have you been doing with the vegetables that you have grown over the past year? ', {
          'Eating' => 'Eating', 
          'Selling' => 'Selling',
          'Swapping' => 'Swapping',
          'Sharing' => 'Sharing them with friends / neighbours',
          'Soup Kitchen' => 'Giving them to a soup kitchen',
          'jams and chutney' => 'Making jams and chutneys',
          'Other' => 'Other',
        end


        step :OtherUsageOfVegFQ do
        input :OtherUsageOfVegFQ, 'What else are you doing with your vegetables?'
      end

    
    #Question that would require grabing information from DB: Are you still eating around xxx meals per day?
    # This difference is noted not just updated if there is a diffence.

   #Question that would require grabing information from DB: Are around x% of your meals including vegetables?

      step :HealthCompairedToLastYear do
        select :HealthCompairedToLastYear, 'Compared to one year ago, how would you rate your health in general now?', {
          'Much better' => 'Much better now than one year ago', 
          'Somewhat better' => 'Somewhat better now than one year ago',
          'The same' => 'About the same',
          'Somewhat worse than one year ago' => 'Somewhat worse than one year ago',
          'Much worse than one year ago' => 'Much worse than one year ago',
        end

           #Question that would require grabing information from DB: Are you still struggling with..... (health problems)

              step :HealthProblemsFQ do
        select :HealthProblemsFQ, 'Do you have any of the following health problems:', {
          'Diabetes' => 'High sugar (diabetes)', 
          'Cancer' => 'Cancer',
          'Arthritis' => 'Arthritis',
          'TB' => 'TB',
          'Any other serious condition' => 'Any other serious condition',
          'None of the above' => 'None of the above', 
        end

         step :FeelingTowardsGardening do
        input :FeelingTowardsGardening, 'How does working in the garden make you feel?'
      end

        step :SpreadingKnowelage do
         select :SpreadingKnowelage , 'Have you helped someone else to make a food garden in the last year?', {
          'yes' => 'yes', 
          'no' => 'no',
        end

        #If answers yes to SpreadingKnowelage ask "SpreadingKnowelageQualitativePro" and skip "SpreadingKnowelageQualitativeNeg"
        # If no than show "SpreadingKnowelageQualitativeNeg" and skip "SpreadingKnowelageQualitativePro"

         step :SpreadingKnowelageQualitativePro do
        input :SpreadingKnowelageQualitativePro, 'Who did you help and how?'
      end

         step :SpreadingKnowelageQualitativeNeg do
        input :SpreadingKnowelageQualitativeNeg, 'Why did you not help anyone else to create a garden?'
      end

      step :FutureGardeningPlans do
         select :FutureGardeningPlans , 'Now that the food garden programme has ended are you going to continue to grow food?', {
          'yes' => 'yes', 
          'no' => 'no',
          'only if' => 'only if'
        end

        #Only show FutureGardeningNeeds if Only if is chosen in FutureGardeningPlans.

        step :FutureGardeningNeeds do
          input :FutureGardeningNeeds, 'What do you need to continue gardening?'
        end

        step :KnowlageOfLifeSkills do
         select :KnowlageOfLifeSkills , 'Do you know about the Soil for Life "Life Skills" programme?', {
          'yes' => 'yes', 
          'no' => 'no',
        end

          step :EnrollmentPlan do
         select :EnrollmentPlan , 'Are you planning on enrolling in the "life Skills" programme? ', {
          'yes' => 'yes', 
          'no' => 'no',
        end

          step :ActivityRecomendations do
          input :ActivityRecomendations, 'What sort of actives would you like to do in the Life Skills Programme?'
        end

         step :FinalWordsFQ do
          input :FinalWordsFQ, 'Is there anything else you would like to say about Soil for Life?'
        end

        #if possible, we would like to be able to take a picture of the  trainee and also their "after picture" of their garden.

         step :TrainerNotesFQ do
          input :TrainerNotesFQ, 'Is there anything else you, as the trainer would like to note?'
      step :overall_training_impression do
        select :overall_training_impression, 'Overall, I thought the training was very good', {
          'Strongly disagree' => 'Strongly disagree', 
          'Disagree' => 'Disagree',
          'No Opinion' => 'No Opinion',
          'Agree' => 'Agree',
          'Strongly Agree' => 'Strongly Agree'
        }
      end

      step :still_growing do
        select :still_growing , 'Since you finished the training are you still growing vegetables in your food garden?', {
          'yes' => 'yes', 
          'no' => 'no'
        }
      end

      step :why_not_growing do
        if params[:still_growing] == 'yes'
           skip_to :health_compaired_to_last_year
           return
        end
        input :why_not_growing, 'Why have you stopped growing vegetables?'
      end

      step :health_compaired_to_last_year do
        select :HealthCompairedToLastYear, 'Compared to one year ago, how would you rate your health in general now?', {
          'Much better' => 'Much better now than one year ago', 
          'Somewhat better' => 'Somewhat better now than one year ago',
          'The same' => 'About the same',
          'Somewhat worse than one year ago' => 'Somewhat worse than one year ago',
          'Much worse than one year ago' => 'Much worse than one year ago'
        }
      end

      step :done do
        proceed 'Submit my information'
      end

      submit do
        item = FinalQuestionnaire.new
        item.overall_training_impression = params[:overall_training_impression]
        item.save!

        redirect_to '/final'
      end
    end
  end
end
