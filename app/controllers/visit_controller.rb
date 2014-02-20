class VisitController < ApplicationController
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
      end

      step :group do
        input :group, 'Group'
      end

      step :trainee_id_number do
        input :trainee_id_number, 'What is your ID number?'
     #   validate :sa_id_number, 'You must enter a valid South African ID number'
      end

        step :still_growing_sv do
          select :still_growing_sv , 'Is the trainee still growing?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end
# Only show WhyTraineeIsntGrowingSV if no to StillGrowingSV.

        step :why_trainee_isnt_growing_sv do
           if params[:still_growing_sv] == 'Yes'
           skip_to :mini_nursery
           return
         end
          input :why_trainee_isnt_growing_sv, 'why is the trainee not groiwing anymore?'
         end

        step :mini_nursery do
          if params[:still_growing_sv] == 'No'
           skip_to :final_comments_sv
           return
         end
        select :mini_nursery , 'Is there a mini Nursery?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        #Don't show mini_nursery_rating if no chosen above

        step :mini_nursery_rating do
         if params[:mini_nursery] == 'No'
           skip_to :compost_heap
           return
         end
         input :mini_nursery_rating, 'Please rate the nursery from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods'
         end

       step :compost_heap do
        select :compost_heap , 'Is there a Compost Heap?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

        #Don't show compost_heap_rating if no chosen above

        step :compost_heap_rating do
         if params[:compost_heap] == 'No'
           skip_to :trench_bed
           return
         end
        input :compost_heap_rating, 'Please rate the Compost heap from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods'
        end

         step :trench_bed do
          select :trench_bed , 'Is there a trench bed?', {
          'yes' => 'yes', 
          'no' => 'no', 
        }
        end

        #Don't show amount_of_trench_beds or trench_bed_rating if no chosen above

        step :amount_of_trench_beds do
         if params[:trench_bed] == 'No'
           skip_to :container_garden
           return
         end
        input :amount_of_trench_beds, 'How many trench beds are there?'
      end

      step :trench_bed_rating do
        input :trench_bed_rating, 'Please rate the trench bed from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods'
        end
        

        step :container_garden do
          select :container_garden, 'Is there a Container tyre garden?', {
          'Yes' => 'Yes', 
          'No' => 'No',
        }
        end

           #Don't show Amount_of_container_gardens or container_garden_rating  if no chosen above

         step :amount_of_container_gardens do
          if params[:container_garden] == 'No'
           skip_to :other_types_of_garden
           return
         end
        input :amount_of_container_gardens, 'How many Container Gardens are there?'
        end

      step :container_garden_rating do
        input :container_garden_rating, 'Please rate the Container garden from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods'
        end


        step :other_types_of_garden do
         select :other_types_of_garden, 'Is there any other kind of garden?', {
          'yes' => 'yes', 
          'no' => 'no',
        }
        end

        #Don't show other_types_of_garden_kind or other_types_of_garden_rating  if no chosen above

         step :other_types_of_garden_kind do
          if params[:other_types_of_garden] == 'No'
           skip_to :vegetales_from_garden_sv
           return
         end
        input :other_types_of_garden_kind, 'What kind of garden is it?'
      end


      step :other_types_of_garden_rating do
        input :other_types_of_garden_rating, 'Please rate the Other type of garden, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods'
        end
        

      step :vegetales_from_garden_sv do
        select :vegetales_from_garden_sv, 'How often does trainee pick vegetables from the garden to eat?', {
          'Everyday' => 'Everyday',
          'Once a week' => 'Once a week',
          '2 to 3 times a month' => '2 to 3 times a month',
          'Once a month' => 'Once a month', 
          'Less than once a month' => 'Less than once a month',
          'six' => 'six',
          'six+' => 'six+',
        }
        end

      step :what_eating_from_garden do
        input :what_eating_from_garden, 'What vegetables has the trainee eaten from the garden in the past month?'
        end

      step :trainee_selling_sp do
        select :trainee_selling_sp, 'Is the trainee selling anything that has come from his/her garden or from life skills lessons?', {
          'yes' => 'yes', 
          'no' => 'no',
        }
        end

      step :trainee_selling_sp_qualitative do
           if params[:trainee_selling_sp] == 'No'
           skip_to :trainee_future_plans
           return
         end
        input :trainee_selling_sp_qualitative, 'What has the trainnee sold in the last month??'
      end

      step :trainee_selling_sq_qualitative_amount do
          select :trainee_selling_sq_qualitative_amount, 'How much has the trainee made in the last month?', {
          'R1-R50' => 'R1-R50', 
          'R51-R100' => 'R51-R100',
          'R101-R150' => 'R101-R150',
          'R151-R200' => 'R151-R200',
          'N/A' => 'Prefer not to answer'
        }
        end

         step :trainee_future_plans do
        input :trainee_future_plans, 'What is the trainee planning to do with his/her garden?'
      end


         step :issues_and_challenges do
        input :issues_and_challenges, 'Are there any Issues or challenges with the garden?'
      end

       step :garden_postivies do
        input :garden_postivies, 'What is good about the garden?'
      end

       step :garden_possibile_improvements do
        input :garden_possibile_improvements, 'What could be better about the garden?'
      end

      step :final_comments_SV do
        input :final_comments_SV, 'Any final comments?'

      step :done do
        proceed 'Submit my information'

      submit do
        item = SupportVisits.new
        item.trainer = params[:trainer]
        item.group = params[:group]
        item.trainee_id_number = params[:trainee_id_number]
        item.still_growing_sv = params[:still_growing_sv]
        item.why_trainee_isnt_growing_sv = params[:why_trainee_isnt_growing_sv]
        item.mini_nursery = params[:mini_nursery]
        item.mini_nursery_rating = params[:mini_nursery_rating]
        item.compost_heap = params[:compost_heap]
        item.compost_heap_rating = params[:compost_heap_rating] 
        item.trench_bed = params[:trench_bed]
        item.amount_of_trench_beds = params[:amount_of_trench_beds]
        item.trench_bed_rating = params[:trench_bed_rating] 
        item.container_garden = params[:container_garden]
        item.amount_of_container_gardens = params[:amount_of_container_gardens]
        item.container_garden_rating = params[:container_garden_rating] 
        item.other_types_of_garden = params[:other_types_of_garden]
        item.other_types_of_garden_kind = params[:other_types_of_garden_kind]
        item.other_types_of_garden_rating = params[:other_types_of_garden_rating] 
        item.vegetales_from_garden_sv = params[:vegetales_from_garden_sv]
        item.what_eating_from_garden = params[:what_eating_from_garden]
        item.trainee_selling_sp = params[:trainee_selling_sp]
        item.trainee_selling_sp_qualitative = params[:trainee_selling_sp_qualitative]
        item.trainee_selling_sq_qualitative_amount = params[:trainee_selling_sq_qualitative_amount]
        item.trainee_future_plans = params[:trainee_future_plans] 
        item.issues_and_challenges = params[:issues_and_challenges]
        item.garden_postivies = params[:garden_postivies]
        item.garden_possibile_improvements = params[:garden_possibile_improvements] 
        item.final_comments_SV = params[:final_comments_SV]
      end
    end
  end
end






end
